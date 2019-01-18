using System;
using System.Collections.Generic;

namespace Test5
{
	/// <summary>
	/// The Program class
	/// </summary>
	public class Program
	{
		/// The Main method
		/// </summary>
		/// <param name="args">Input args of programm</param>
		public static void Main(string[] args)
		{
			char[] vn = { 'S', 'A', 'B' };
			char[] vt = { 'a', 'b' };

			HashSet<string> s = new HashSet<string>
			{
				"aB",
				"bA"
			};

			HashSet<string> a = new HashSet<string>
			{
				"a",
				"bAA",
				"aS"
			};

			HashSet<string> b = new HashSet<string>
			{
				"b",
				"aBB",
				"bS"
			};

			Dictionary<char, HashSet<string>> p = new Dictionary<char, HashSet<string>>
			{
				{ 'S', s },
				{ 'A', a },
				{ 'B', b }
			};

			Grammar grammar = new Grammar('S', vn, vt, p);

			HashSet<string> first = grammar.First("A", 5);
			HashSet<string> follow = grammar.Follow('A', 3);

			Console.Write("FIRST: ");
			foreach (string str in first)
			{
				Console.Write(str + " ");
			}

			Console.WriteLine("\n");
			Console.Write("FOLLOW: ");
			foreach (string str in follow)
			{
				Console.Write(str + " ");
			}
			Console.WriteLine("\n");
		}
	}
}
