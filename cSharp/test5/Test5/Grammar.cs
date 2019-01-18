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
		/// <summary>
		/// S - Non terminal
		/// </summary>
		public char S { get; }
		private Dictionary<char, HashSet<string>> Rules;

		/// <summary>
		/// Create grammar
		/// </summary>
		/// <param name="s">S - Non terminal</param>
		/// <param name="vn">Non terminal alphabet</param>
		/// <param name="vt">Terminal alphabet</param>
		/// <param name="p">Rules</param>
		public Grammar(char s, char[] vn, char[] vt, Dictionary<char, HashSet<string>> p)
		{
			S = s;
			NonTerminal = vn;
			Terminal = vt;
			Rules = p;
		}

		/// <summary>
		/// Apply rules
		/// </summary>
		/// <param name="n">Non terminal</param>
		/// <returns>Set of words</returns>
		public HashSet<string> Rule(char n)
		{
			return Rules[n];
		}

		/// <summary>
		/// Check symbol
		/// </summary>
		/// <param name="t">Terminal</param>
		/// <returns>Result</returns>
		public bool IsTerminal(char t)
		{
			return Array.IndexOf(Terminal, t) > -1;
		}

		/// <summary>
		/// Check symbol
		/// </summary>
		/// <param name="t">Non terminal</param>
		/// <returns>Result</returns>
		public bool IsNonTerminal(char n)
		{
			return Array.IndexOf(NonTerminal, n) > -1;
		}

		/// <summary>
		/// FRIST function
		/// </summary>
		/// <param name="str">Input string</param>
		/// <param name="k">K</param>
		/// <returns>Set of words</returns>
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
			while (lastSize != lastF.Count)
			{
				i++;
				lastSize = lastF.Count;
				lastF = F(str[0], k, i);
			}

			return lastF;
		}

		/// <summary>
		/// FOLLOW function
		/// </summary>
		/// <param name="n">Non terminal</param>
		/// <param name="k">K</param>
		/// <returns>Set of words</returns>
		public HashSet<string> Follow(char n, int k)
		{
			int i = 0;
			int lastSize = 0;
			HashSet<string> lastFi = Fi(S, n, k, i);
			while (lastSize != lastFi.Count)
			{
				i++;
				lastSize = lastFi.Count;
				lastFi = Fi(S, n, k, i);
			}

			return lastFi;
		}

		private HashSet<string> Fi(char a, char b, int k, int i)
		{
			HashSet<string> result = new HashSet<string>();

			if (i == 0)
			{
				HashSet<string> rules = Rule(a);
				foreach (string word in rules)
				{
					for (int j = 0; j < word.Length; j++)
					{
						if (word[j] == b)
						{
							result.IntersectWith(First(word.Substring(j + 1), k));
						}
					}
				}
			}
			else
			{
				result = Fi(a, b, k, i - 1);
				HashSet<string> rules = Rule(a);
				foreach (string word in rules)
				{
					for (int j = 0; j < word.Length; j++)
					{
						if (IsNonTerminal(word[j]))
						{
							result.IntersectWith(PlusK(Fi(word[j], b , k , i - 1), First(word.Substring(j + 1), k), k));
						}
					}
				}
			}

			return result;
		}

		private HashSet<string> F(char symbol, int k, int i)
		{
			HashSet<string> result = new HashSet<string>();

			if (IsTerminal(symbol))
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
					while (j < k && IsTerminal(word[j]))
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
