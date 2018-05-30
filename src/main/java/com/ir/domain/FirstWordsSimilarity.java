//package com.ir.domain;
//
//
//import org.apache.lucene.analysis.payloads.PayloadHelper;
//import org.apache.lucene.index.FieldInvertState;
//import org.apache.lucene.search.similarities.ClassicSimilarity;
//import org.apache.lucene.util.BytesRef;
//
///**
// * A custom similarity measure used for boosting the score of documents 
// * containing the search term among the first 10 words of the contents field.
// * @version 1.0
// * @author Bogdan
// * @see ClassicSimilarity
// */
//public class FirstWordsSimilarity extends ClassicSimilarity {
//	
//	@Override
//	public float coord(int overlap, int maxOverlap) {
//		// Used for boosting score based on the number of overlapping terms in the query and document
//		// Example: if (overlap == 1) return 10; -> boosts single-term matchings
//		return super.coord(overlap, maxOverlap);
//	}
//	
//	@Override
//	public float idf(long docFreq, long docCount) {
//		// Used for boosting score based on the number of docs which contain the term and the total number of docs
//		// Example: if (docFreq <= 2) return super.idf(docFreq * 100, docCount); -> penalizes docs containing rare terms
//		return super.idf(docFreq, docCount);
//	}
//	
//	@Override
//	public float lengthNorm(FieldInvertState state) {
//		// Used for boosting score based on current field properties
//		// Example: if (state.getLength() % 2 == 1) return super.lengthNorm(state) * 100; -> boosts docs which have the Field value as odd number
//		return super.lengthNorm(state);
//	}
//	
//	@Override
//	public float queryNorm(float sumOfSquaredWeights) {
//		// Used for boosting the score of all results of a query
//		return super.queryNorm(sumOfSquaredWeights);
//	}
//	
//	@Override
//	public float scorePayload(int doc, int start, int end, BytesRef payload) {
//		// Used for boosting or hindering score by modifying the payload of terms
//		float val = PayloadHelper.decodeFloat(payload.bytes); // It's 1, as we defined it in PayloadFilter
//		if(start >= 0 && start <= 9) // boost docs when the term is among the first 10 words of contents field
//			return val * 3f;
//		return super.scorePayload(doc, start, end, payload);
//	}
//	
//	@Override
//	public float sloppyFreq(int distance) {
//		return super.sloppyFreq(distance);
//	}
//	
//	@Override
//	public float tf(float freq) {
//		// Used for boosting score based on the number of term occurences within the document
//		// Example: if (freq > 1f) return super.tf(freq) * 100; -> boosts docs containing the term more than once
//		return super.tf(freq);
//	}
//}
//




package com.ir.domain;

import org.apache.lucene.analysis.payloads.PayloadHelper;


import org.apache.lucene.search.CollectionStatistics;
import org.apache.lucene.search.Explanation;
import org.apache.lucene.search.TermStatistics;
import org.apache.lucene.search.similarities.BM25Similarity;
import org.apache.lucene.search.similarities.ClassicSimilarity;

import org.apache.lucene.util.BytesRef;

/**
 * A custom similarity measure used for boosting the score of documents 
 * containing the search term among the first 10 words of the contents field.
 * @version 1.0
 * @author Bogdan
 * @see ClassicSimilarity
 */
public class FirstWordsSimilarity extends BM25Similarity {
	
	public FirstWordsSimilarity() {
		super(1.2f, 0.75f);
	}
	
	
	@Override
	public float coord(int overlap, int maxOverlap) {
		// Used for boosting score based on the number of overlapping terms in the query and document
		// Example: if (overlap == 1) return 10; -> boosts single-term matchings
		return super.coord(overlap, maxOverlap);
	}
	
	@Override
	public float idf(long docFreq, long docCount) {
		// Used for boosting score based on the number of docs which contain the term and the total number of docs
		// Example: if (docFreq <= 2) return super.idf(docFreq * 100, docCount); -> penalizes docs containing rare terms
		
		/*log(1 + (numDocs - docFreq + 0.5)/(docFreq + 0.5)).*/
		
		return super.idf(docFreq, docCount);
	}
	
//	@Override
//	public float lengthNorm(FieldInvertState state) {
//		// Used for boosting score based on current field properties
//		// Example: if (state.getLength() % 2 == 1) return super.lengthNorm(state) * 100; -> boosts docs which have the Field value as odd number
//		return super.lengthNorm(state);
//	}
	
	@Override
	public float queryNorm(float sumOfSquaredWeights) {
		// Used for boosting the score of all results of a query
		return super.queryNorm(sumOfSquaredWeights);
	}
	
	@Override
	public float scorePayload(int doc, int start, int end, BytesRef payload) {
		// Used for boosting or hindering score by modifying the payload of terms
		float val = PayloadHelper.decodeFloat(payload.bytes); // It's 1, as we defined it in PayloadFilter
		if(start >= 0 && start <= 9) // boost docs when the term is among the first 10 words of contents field
			return val * 3f;
		return super.scorePayload(doc, start, end, payload);
	}
	
	@Override
	public float sloppyFreq(int distance) {
		
		/*return 1.0f / (distance + 1);*/
		return super.sloppyFreq(distance);
	}
	@Override
	protected float avgFieldLength(CollectionStatistics collectionStats) {
		/*
		 * The default implementation computes the average as sumTotalTermFreq / maxDoc,
		 *  or returns 1 if the index does not store sumTotalTermFreq
		 * (Lucene 3.x indexes or any field that omits frequency information).
		 * */
		return super.avgFieldLength(collectionStats);
	}
	
	@Override
	protected byte encodeNormValue(float boost, int fieldLength) {
		/* 
		 * The default implementation encodes boost / sqrt(length) with SmallFloat.floatToByte315(float).
		 * This is compatible with Lucene's default implementation.
		 * If you change this, then you should change decodeNormValue(byte) to match.
		 * */
		return super.encodeNormValue(boost, fieldLength);
	}
	
	@Override
	protected float decodeNormValue(byte b) {
		/*
		 * 
		 * The default implementation returns 1 / f2 where f is SmallFloat.byte315ToFloat(byte).
		 * 
		 * */
		return super.decodeNormValue(b);
	}
	
	@Override
	public void setDiscountOverlaps(boolean v) {
		/*
		 * Sets whether overlap tokens 
		 * (Tokens with 0 position increment) are ignored when computing norm.
		 * By default this is true, meaning overlap tokens do not count when computing norms.
		 * */
		super.setDiscountOverlaps(v);
	}
	
	@Override
	public boolean getDiscountOverlaps() {
		/*
		  Returns true if overlap tokens are discounted from the document's length. 
		 */
		return super.getDiscountOverlaps();
	}
	
	@Override
	public Explanation idfExplain(CollectionStatistics collectionStats, TermStatistics termStats) {
		// TODO Auto-generated method stub
		return super.idfExplain(collectionStats, termStats);
	}
	@Override
	public Explanation idfExplain(CollectionStatistics collectionStats, TermStatistics[] termStats) {
		// TODO Auto-generated method stub
		return super.idfExplain(collectionStats, termStats);
	}
	
	
//	@Override
//	public float tf(float freq) {
//		// Used for boosting score based on the number of term occurences within the document
//		// Example: if (freq > 1f) return super.tf(freq) * 100; -> boosts docs containing the term more than once
//		return super.tf(freq);
//	}
}
