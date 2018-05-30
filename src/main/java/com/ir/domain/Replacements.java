package com.ir.domain;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Replacements {

	public static String replacements (String string){
		
		string = string.toLowerCase();
		
		string = string.replaceAll("\\'s", "");

		// replace: ex: MAY 22 To: 22/5; 22/5(month order)
		string = Replacements.replaceMonthSpaceDigit(string);

		// replace: 22/5/2018, 22.5.2018, 22-5-2018 To: 22/5/2018 & 22/5
		string = Replacements.replaceMonth_Digit_Digit_Digit(string);
		
		// Replace Coins; ex: $50 To: dollar50;
		string = Replacements.replaceCoins(string);

		// replace Times; ex: 4 weeks or four week To: 4week
		string = Replacements.replaceTimes(string);

		// remove special character.
		string = transformText(string);
		
		return string;
		
	}
	
	private static String transformText(String text) {

		text = text.replaceAll("\\'s", "");

		// Replacing the SGML tags with space.
		text = text.replaceAll("\\<.*?>", " ");

		// Remove digits
		// text = text.replaceAll("[\\s+][\\d+]", "");

		// Remove the special characters
		text = text.replaceAll("[+^:,?;=%#&~`!.@*_)(}{]", "");

		text = text.replaceAll("\\$+", "");
		text = text.replaceAll("€+", "");
		text = text.replaceAll("£+", "");

		// Replace "'" with a space
		text = text.replaceAll("\\'+", " ");

		text = text.replaceAll("[^0-9]+/[^0-9]+", " ");
		
		// Replace """ with a space
		text = text.replaceAll("\"+", " ");

		// Replace - with space to count two words
		text = text.replaceAll("-", " ");

		// Replace – with space to count two words
		text = text.replaceAll("\\–", " ");

		// Remove multiple white spaces
		text = text.replaceAll("\\s+", " ");

		text = text.replaceAll("[a-zA-Z]\\-[a-zA-Z]", " ");
		return text;
	}
	
	
	/*
	 * replace: ex: mar 22 To: 22/3/2018; 22/3(month order)/2018(current year)
	 */
	private static String replaceMonthSpaceDigit(String str) {

		HashMap<String, Integer> months = new HashMap<String, Integer>();
		months.put("jan", 1);
		months.put("feb", 2);
		months.put("march", 3);
		months.put("apr", 4);
		months.put("may", 5);
		months.put("june", 6);
		months.put("july", 7);
		months.put("aug", 8);
		months.put("sept", 9);
		months.put("oct", 10);
		months.put("nov", 11);
		months.put("dec", 12);

		Iterator it = months.entrySet().iterator();
		while (it.hasNext()) {
			Map.Entry pair = (Map.Entry) it.next();

			Pattern p = Pattern.compile(pair.getKey() + " " + "[0-9]{1,2}");
			Matcher m = p.matcher(str);
			boolean b = m.find();
			if (b) {
				String[] strDate = m.group().split(" ");
				str = str.replaceAll(m.group(), strDate[1] + "/" + pair.getValue());
				// strDate[1] + "/" + pair.getValue() + "/" +
				// Calendar.getInstance().get(Calendar.YEAR));

			}

			it.remove(); // avoids a ConcurrentModificationException
		}
		return str;
	}

	/*
	 * replace: 4 minute To: 4minute, four minutes to: fourminutes.
	 */
	private static String replaceTimes(String str) {

		List<String> times = new ArrayList<String>();
		times.add("second");
		times.add("seconds");
		times.add("minute");
		times.add("minutes");
		times.add("hour");
		times.add("hours");
		times.add("day");
		times.add("days");
		times.add("week");
		times.add("weeks");
		times.add("month");
		times.add("months");
		times.add("year");
		times.add("years");
		times.add("decade");
		times.add("decades");
		times.add("century");
		times.add("centurys");

		List<String> numbers = new ArrayList<String>();
		numbers.add("zero");
		numbers.add("one");
		numbers.add("two");
		numbers.add("three");
		numbers.add("four");
		numbers.add("five");
		numbers.add("six");
		numbers.add("seven");
		numbers.add("eight");
		numbers.add("nine");
		numbers.add("ten");
		numbers.add("eleven");
		numbers.add("twelve");
		numbers.add("[0-9]");

		for (String i : numbers)
			for (String string : times) {

				Pattern p = Pattern.compile(i + " " + string);
				Matcher m = p.matcher(str);
				boolean b = m.find();
				if (b) {
					String[] strDate = m.group().split(" ");
					str = str.replaceAll(m.group(), strDate[0] + string);

				}
			}
		return str;
	}

	/*
	 * replace: 22/5/2018, 22.5.2018, 22-5-2018 To: 22/5/2018
	 */
	private static String replaceMonth_Digit_Digit_Digit(String str) {

		Pattern p = Pattern.compile("[0-9]{1,2}.[0-9]{1,2}.[0-9]{4}");
		Matcher m = p.matcher(str);
		boolean b = m.find();
		if (b) {
			String[] s = m.group().split("-");
			String[] s1 = m.group().split("\\.");

			if (s.length == 3) {
				str = str.replaceAll(m.group(), s[0] + "/" + s[1] + "/" + s[2]);
				str = str + " " + s[0] + "/" + s[1];
			}
			if (s1.length == 3) {
				str = str.replaceAll(m.group(), s1[0] + "/" + s1[1] + "/" + s1[2]);
				str = str + " " + s1[0] + "/" + s1[1];
			}
		}
		return str;
	}

	private static String replaceCoins(String text) {

		text = text.replaceAll("(\\$)([0-9]+[.][0-9]+)", "dollar");
		text = text.replaceAll("(\\$)([0-9]+)", "dollar");

		text = text.replaceAll("(€)([0-9]+[.][0-9]+)", "euro");
		text = text.replaceAll("(€)([0-9]+)", "euro");

		text = text.replaceAll("(£)([0-9]+[.][0-9]+)", "pound");
		text = text.replaceAll("(£)([0-9]+)", "pound");

		return text;
	}
	
}
