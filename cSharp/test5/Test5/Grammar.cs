using System;
using System.Collections.Generic;
using System.Text;

namespace Test5
{
	/// <summary>
	/// The Grammar class
	/// </summary>
	public class Grammar
	{
		/// <summary>
		/// Non terminal alphabet
		/// </summary>
		public char[] NonTerminal { get; }
		/// <summary>
		/// Terminal alphabet
		/// </summary>
		public char[] Terminal { get; }
		private readonly HashSet<string>[] Rules;

		/// <summary>
		/// Create grammar
		/// </summary>
		/// <param name="vn">Non terminal alphabet</param>
		/// <param name="vt">Terminal alphabet</param>
		/// <param name="p">Rules</param>
		public Grammar(char[] vn, char[] vt, HashSet<string>[] p)
		{
			NonTerminal = vn;
			Terminal = vt;
			Rules = p;
		}

		/// <summary>
		/// Apply rules
		/// </summary>
		/// <param name="t">Terminal</param>
		/// <returns>Set of words</returns>
		public HashSet<string> Rule(char t)
		{
			return Rules[t];
		}

		public HashSet<string> First(string str, int k)
		{
			if (str.Length > 1)
			{
				return PlusK(First(str[0].ToString(), k), First(str.Substring(1), k), k);
			}

			HashSet<string> result = new HashSet<string>();

			if (str.Length == 0)
			{
				result.Add("");
				return result;
			}

			int i = 0;
			int lastSize = 0;
			HashSet<string> lastF = F(str[0], k, i);
			while (lastSize == lastF.Count)
			{
				i++;
				lastSize = lastF.Count;
				lastF = F(str[0], k, i);
			}

			return lastF;
		}

		private HashSet<string> F(char symbol, int k, int i)
		{
			HashSet<string> result = new HashSet<string>();

			if (Array.IndexOf(Terminal, symbol) > -1)
			{
				result.Add(symbol.ToString());
				return result;
			}

			if (i == 0)
			{
				HashSet<string> rules = Rule(symbol);
				foreach (string word in rules)
				{
					int j = 0;
					while ((j < k) && (Array.IndexOf(Terminal, word[j]) > -1))
					{
						j++;
					}

					result.Add(word.Substring(0, j - 1));
				}
			}
			else
			{
				result = F(symbol, k, i - 1);
				HashSet<string> rules = Rule(symbol);
				foreach (string word in rules)
				{
					HashSet<string> temp = F(word[0], k, i - 1);
					for (int j = 1; j < word.Length; j++)
					{
						temp = PlusK(temp, F(word[j], k, i - 1), k);
					}

					result.IntersectWith(temp);
				}
			}

			return result;
		}

		private HashSet<string> PlusK(HashSet<string> l1, HashSet<string> l2, int k)
		{
			HashSet<string> result = new HashSet<string>();

			foreach (string word in l1)
			{
				if (word.Length >= k)
				{
					result.Add(word.Substring(0, k - 1));
				}
				else
				{
					foreach (string wordPath in l2)
					{
						result.Add(word + wordPath.Substring(0, k - word.Length - 1));
					}
				}
			}

			return result;
		}
	}
}
