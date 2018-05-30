package com.ir.domain;

import static com.ir.domain.LuceneUtils.*;

import java.io.File;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.InvalidPathException;
import java.nio.file.Paths;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.Date;

import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.document.DateTools;
import org.apache.lucene.document.DateTools.Resolution;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.StringField;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.CorruptIndexException;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.index.IndexWriterConfig.OpenMode;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.tika.Tika;
import org.apache.tika.exception.TikaException;
import org.apache.tika.metadata.Metadata;
import org.apache.tika.parser.AutoDetectParser;
import org.apache.tika.parser.ParseContext;
import org.apache.tika.sax.BodyContentHandler;
import org.jsoup.Jsoup;
import org.xml.sax.SAXException;

/**
 * The Indexer class manages an index by using an <i> IndexWriter. </i>
 * <p>
 * <b>TODO:</b> setter for the IndexWriter, as to change the index directory
 * path.
 * </p>
 * 
 * @version 2.7
 * @see IndexWriter
 */
public class Indexer {

	private IndexWriter writer;

	/**
	 * The constructor takes the desired index directory path, then configures and
	 * builds the IndexWriter.
	 * 
	 * @param indexDirPath
	 *            - the path of the desired index directory
	 * @throws InvalidPathException
	 * @throws IOException
	 */
	public Indexer(String indexDirPath, String openMode) throws InvalidPathException, IOException {

		Directory indexDir = FSDirectory.open(Paths.get(indexDirPath));

		IndexWriterConfig conf = new IndexWriterConfig(); // The default constructor user the StandardAnalyzer as an
															// analyzer
		conf.setSimilarity(new FirstWordsSimilarity()); // Use our custom scoring class - delete if standard scoring is
														// desired

		if (openMode.equals("CREATE"))
			conf.setOpenMode(OpenMode.CREATE);
		else if (openMode.equals("APPEND"))
			conf.setOpenMode(OpenMode.APPEND);
		else
			conf.setOpenMode(OpenMode.CREATE_OR_APPEND);

		writer = new IndexWriter(indexDir, conf);
	}

	public void close() throws CorruptIndexException, IOException {

		writer.close();
	}

	// Creates an indexable Document from the given File
	private Document createDocument(File file) throws IOException {

		Document doc = new Document();

		String contents = "";
		TokenStream tokens = null;
		Tika tika = new Tika();
		String filetype = tika.detect(file);

		if (filetype.equals("text/html")) {

			org.jsoup.nodes.Document docJsoup = Jsoup.parse(file, "utf-8");
			contents = docJsoup.select("html").text();
			System.out.println("_______");
			System.out.println(contents);
			System.out.println("_______");
			tokens = LuceneUtils.getTokenStream(contents);
			TextField contentField = new TextField(CONTENTS, tokens);
			
			
			tokens = LuceneUtils.getTokenStream(docJsoup.title());
			TextField titleField = new TextField(TITLE,tokens);
			titleField.setBoost(15);

			tokens = LuceneUtils.getTokenStream(docJsoup.getElementsByTag("h1").text());
			TextField h1Field = new TextField(H1,tokens);
			titleField.setBoost(10);
			
			tokens = LuceneUtils.getTokenStream(docJsoup.getElementsByTag("h2").text());
			TextField h2Field = new TextField(H2,tokens);
			titleField.setBoost(5);
			System.out.println("**********");
			System.out.println(docJsoup.select("meta[name='description']").get(0).attr("content"));
			System.out.println("**********");
			tokens = LuceneUtils.getTokenStream(docJsoup.select("meta[name='description']").get(0).attr("content"));
			TextField descriptionField = new TextField(DESCRIPTION, tokens);
			
			tokens = LuceneUtils.getTokenStream(docJsoup.select("meta[name='keywords']").first().attr("content"));
			TextField keywordsField = new TextField(KEYWORDS,tokens);
			
			
			StringField nameField = new StringField(FILE_NAME, file.getName(), Field.Store.YES);
			StringField pathField = new StringField(FILE_PATH, file.getCanonicalPath(), Field.Store.YES);

			// Store the file creation date
			BasicFileAttributes attr = Files.readAttributes(file.toPath(), BasicFileAttributes.class);
			long milliseconds = attr.creationTime().toMillis();
			Date creation = new Date(milliseconds);
			String formattedDate = DateTools.dateToString(creation, Resolution.DAY);

			StringField creationDateField = new StringField(CREATED_AT, formattedDate, Field.Store.YES);

			// Store the file last modification date
			Date lastModified = new Date(file.lastModified());
			formattedDate = DateTools.dateToString(lastModified, Resolution.DAY);

			StringField lastModifiedDateField = new StringField(LAST_MODIFIED, formattedDate, Field.Store.YES);

			// Store the extension of the file
			String extension = "";

			int i = file.getCanonicalPath().lastIndexOf('.');
			if (i >= 0) {
				extension = file.getCanonicalPath().substring(i + 1);
			}

			StringField extensionField = new StringField(FILE_EXTENSION, extension, Field.Store.YES);

			// Add the Fields to the Document
			doc.add(contentField);
			doc.add(descriptionField);
			doc.add(keywordsField);
			doc.add(titleField);
			doc.add(h1Field);
			doc.add(h2Field);
			doc.add(nameField);
			doc.add(pathField);
			doc.add(creationDateField);
			doc.add(lastModifiedDateField);
			doc.add(extensionField);

			// tokens.close(); // Can't close the Stream because the TokenStream contract is
			// violated
		} else {
			Metadata metadata = new Metadata();
			BodyContentHandler handler = new BodyContentHandler(10 * 1024 * 1024);
			ParseContext context = new ParseContext();
			AutoDetectParser parser = new AutoDetectParser();
			InputStream stream = new FileInputStream(file); // open stream
			try {
				parser.parse(stream, handler, metadata, context); // parse the stream
			} catch (TikaException e) {
				e.printStackTrace();
			} catch (SAXException e) {
				e.printStackTrace();
			} finally {
				stream.close(); // close the stream
			}
			contents = handler.toString();
			
			tokens = LuceneUtils.getTokenStream(contents);
			// Index and store the contents, name and path of the file
			TextField contentField = new TextField(CONTENTS, tokens);
			StringField nameField = new StringField(FILE_NAME, file.getName(), Field.Store.YES);
			StringField pathField = new StringField(FILE_PATH, file.getCanonicalPath(), Field.Store.YES);

			// Store the file creation date
			BasicFileAttributes attr = Files.readAttributes(file.toPath(), BasicFileAttributes.class);
			long milliseconds = attr.creationTime().toMillis();
			Date creation = new Date(milliseconds);
			String formattedDate = DateTools.dateToString(creation, Resolution.DAY);

			StringField creationDateField = new StringField(CREATED_AT, formattedDate, Field.Store.YES);

			// Store the file last modification date
			Date lastModified = new Date(file.lastModified());
			formattedDate = DateTools.dateToString(lastModified, Resolution.DAY);

			StringField lastModifiedDateField = new StringField(LAST_MODIFIED, formattedDate, Field.Store.YES);

			// Store the extension of the file
			String extension = "";

			int i = file.getCanonicalPath().lastIndexOf('.');
			if (i >= 0) {
				extension = file.getCanonicalPath().substring(i + 1);
			}

			StringField extensionField = new StringField(FILE_EXTENSION, extension, Field.Store.YES);

			// Add the Fields to the Document
			doc.add(contentField);
			doc.add(nameField);
			doc.add(pathField);
			doc.add(creationDateField);
			doc.add(lastModifiedDateField);
			doc.add(extensionField);

			// tokens.close(); // Can't close the Stream because the TokenStream contract is
			// violated
		}
		return doc;
	}

	// Indexes a File
	private void indexFile(File file) throws IOException {

		System.out.println("Indexing " + file.getCanonicalPath());
		Document doc = createDocument(file);

		writer.addDocument(doc);
	}

	private void readFiles(final File rootFile) throws IOException {
		// Go through every entry in the root path

		for (final File file : rootFile.listFiles()) {
			// If entry is a directory, recursively parse it
			if (file.isDirectory()) {
				this.readFiles(file);
			} else {
				// Else, read this file
				this.indexFile(file);
				// Increment total number of documents after parsing
				// this.setTotalDocuments(this.getTotalDocuments() + 1);
			}
		}
	}

	// Creates the Index by indexing the specified files
	// public int createIndex(String dataDirPath, FileFilter filter) throws
	// IOException{
	public int createIndex(String dataDirPath) throws IOException {

		File root = new File(dataDirPath);

		// Take all the files from the source directory
		readFiles(root);

		// // for(File f : files){
		// if(f.exists() && !f.isDirectory() && !f.isHidden() && f.canRead() &&
		// filter.accept(f)){
		// indexFile(f);
		// }
		// }

		// Return the number of indexed files
		return writer.numDocs();
	}
}
