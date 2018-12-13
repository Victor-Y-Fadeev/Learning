using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;

namespace Coding
{
	/// <summary>
	/// Lexical analysis
	/// </summary>
	public static class Lexer
	{
		private const int firstTerminalCode = 51;
		private const int firstSemanticsCode = 101;
		private const int firstNonTerminalCode = 11;
		private const int eofgramCode = 1000;

		private static StringBuilder Replacer(StringBuilder input, string pattern, int code)
		{
			Match m = Regex.Match(input.ToString(), pattern);

			SortedDictionary<string, int> table = new SortedDictionary<string, int>(new CustomComparer());
			string firstSpace = " ";

			if (code == firstNonTerminalCode)
			{
				table.Add("Eofgram", eofgramCode);
				firstSpace = "";
			}

			while (m.Success)
			{
				if (!table.ContainsKey(m.Value))
				{
					table.Add(m.Value, code);
					code++;
				}

				m = m.NextMatch();
			}

			foreach (KeyValuePair<string, int> elem in table)
			{
				input.Replace(elem.Key, firstSpace + elem.Value.ToString() + " ");
			}

			return input;
		}

		private static StringBuilder SpaceCleaner(StringBuilder input)
		{
			string pattern = "[0-9]  +[0-9]";

			for (int i = 0; i < 2; i++)
			{ 
				Match m = Regex.Match(input.ToString(), pattern);

				while (m.Success)
				{
					input.Replace(m.Value, m.Value[0] + " " + m.Value[m.Value.Length - 1]);

					m = m.NextMatch();
				}
			}

			return input;
		}

		/// <summary>
		/// Convolution of code
		/// </summary>
		/// <param name="input">Input code</param>
		/// <returns>Convolution of code</returns>
		public static string Convolution(string input)
		{
			StringBuilder sb = new StringBuilder(input);

			sb = Replacer(sb, "'[^']*'", firstTerminalCode);
			sb = Replacer(sb, @"\$[A-Za-z]+[A-Za-z0-9]*", firstSemanticsCode);
			sb = Replacer(sb, "[A-Za-z]+[A-Za-z0-9]*", firstNonTerminalCode);

			sb.Replace(":", " 1 ");
			sb.Replace("(", " 2 ");
			sb.Replace(")", " 3 ");
			sb.Replace(".", " 4 ");
			sb.Replace("*", " 5 ");
			sb.Replace(";", " 6 ");
			sb.Replace(",", " 7 ");
			sb.Replace("#", " 8 ");
			sb.Replace("[", " 9 ");
			sb.Replace("]", " 10 ");

			sb = SpaceCleaner(sb);

			return sb.ToString();
		}

		private class CustomComparer : IComparer<string>
		{
			public int Compare(string x, string y)
			{
				if (x.Length.CompareTo(y.Length) == 0)
					return x.CompareTo(y);

				return (-1) * x.Length.CompareTo(y.Length);
			}
		}
	}
}
