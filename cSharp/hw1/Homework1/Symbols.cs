using System.Collections.Generic;

namespace Homework1
{
	/// <summary>
	/// Class for work with symbols sets
	/// </summary>
	public static class Symbols
	{
		private static HashSet<char> SymbolsSet(string str)
		{
			HashSet<char> symbols = new HashSet<char>();

			for (int i = 0; i < str.Length; i++)
			{
				symbols.Add(str[i]);
			}

			return symbols;
		}

		/// <summary>
		/// Symbols included to both texts
		/// </summary>
		/// <param name="first">First texe</param>
		/// <param name="second">Second text</param>
		/// <returns>Symbols array</returns>
		public static char[] IntersectionSymbols(string first, string second)
		{
			HashSet<char> set = SymbolsSet(first);
			set.IntersectWith(SymbolsSet(second));

			char[] result = new char[set.Count];
			set.CopyTo(result);

			return result;
		}

		/// <summary>
		/// Symbols included only in first text
		/// </summary>
		/// <param name="first">First texe</param>
		/// <param name="second">Second text</param>
		/// <returns>Symbols array</returns>
		public static char[] ExceptionSymbols(string first, string second)
		{
			HashSet<char> set = SymbolsSet(first);
			set.ExceptWith(SymbolsSet(second));

			char[] result = new char[set.Count];
			set.CopyTo(result);

			return result;
		}

		/// <summary>
		/// Count different symbols of text
		/// </summary>
		/// <param name="text">Text</param>
		/// <returns>Count of symbols</returns>
		public static int DifferentSymbols(string text)
		{
			return SymbolsSet(text).Count;
		}
	}
}
