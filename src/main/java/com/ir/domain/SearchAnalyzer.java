package com.ir.domain;

import static com.ir.domain.LuceneUtils.*;

import java.io.StringReader;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.Tokenizer;
import org.apache.lucene.analysis.core.LowerCaseFilter;
import org.apache.lucene.analysis.core.StopFilter;
import org.apache.lucene.analysis.core.WhitespaceTokenizer;
import org.apache.lucene.analysis.snowball.SnowballFilter;
import org.apache.lucene.analysis.standard.StandardTokenizer;

/**
 * Performs the analysis of the user's search query.
 * <p>
 * Takes the user query string, tokenizes it, converts it to lowercase, removes
 * topwords and stems it.
 * </p>
 * 
 * @version 2.7
 * @see Analyzer
 */



// for query.
public class SearchAnalyzer extends Analyzer {

	private String queryString;

	public SearchAnalyzer(String userQuery) {
		queryString = userQuery;
	}

	@Override
	protected TokenStreamComponents createComponents(String fieldName) {

		Tokenizer source = new WhitespaceTokenizer();
		source.setReader(new StringReader(queryString));
		TokenStream tokens = null;

		//tokens = new LowerCaseFilter(source);
		tokens = new StopFilter(source, STOPWORDS); // Remove stopwords
		//tokens = new SnowballFilter(tokens, LANGUAGE); // Perform stemming
		tokens = new PayloadFilter(tokens); // Attaches a payload to each token; should delete if payload is not desired

		return new TokenStreamComponents(source, tokens);
	}
}
