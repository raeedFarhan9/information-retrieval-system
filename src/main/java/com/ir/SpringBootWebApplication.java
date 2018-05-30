package com.ir;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import org.apache.coyote.http11.AbstractHttp11Protocol;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.embedded.tomcat.TomcatConnectorCustomizer;
import org.springframework.boot.context.embedded.tomcat.TomcatEmbeddedServletContainerFactory;
import org.springframework.context.annotation.Bean;

import com.ir.domain.Launcher;

import edu.smu.tspell.wordnet.Synset;
import edu.smu.tspell.wordnet.WordNetDatabase;
import org.apache.lucene.wordnet.SynonymMap;

@SpringBootApplication
public class SpringBootWebApplication implements CommandLineRunner {

	private int maxUploadSizeInMb = 10 * 1024 * 1024; // 10 MB

	// Tomcat large file upload connection reset
	// http://www.mkyong.com/spring/spring-file-upload-and-connection-reset-issue/
	@Bean
	public TomcatEmbeddedServletContainerFactory tomcatEmbedded() {

		TomcatEmbeddedServletContainerFactory tomcat = new TomcatEmbeddedServletContainerFactory();

		tomcat.addConnectorCustomizers((TomcatConnectorCustomizer) connector -> {
			if ((connector.getProtocolHandler() instanceof AbstractHttp11Protocol<?>)) {
				// -1 means unlimited
				((AbstractHttp11Protocol<?>) connector.getProtocolHandler()).setMaxSwallowSize(-1);
			}
		});

		return tomcat;

	}

	public static void main(String[] args) throws FileNotFoundException, IOException {


		SpringApplication.run(SpringBootWebApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {

		Launcher launcher = new Launcher();
		launcher.loop();

	}
}

//		String[] words = new String[] { "hard", "woods", "forest", "wolfish", "xxxx", "worker", "book", "sport" };
//		SynonymMap map = new SynonymMap(new FileInputStream("C:\\prolog\\wn_s.pl"));
//		for (int i = 0; i < words.length; i++) {
//			String[] synonyms = map.getSynonyms(words[i]);
//			System.out.println(words[i] + ":" + java.util.Arrays.asList(synonyms).toString());
//		}