using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;

namespace Test1
{
	/// <summary>
	/// The Program class
	/// </summary>
	public class Program
	{
		/// <summary>
		/// Count lines which including words
		/// </summary>
		/// <param name="str">Source text</param>
		/// <returns>Words in lines</returns>
		private static SortedDictionary<string, SortedSet<int>> Inclusion(string str)
		{
			string[] lines = str.Split('\n');
			SortedDictionary<string, SortedSet<int>> result = new SortedDictionary<string, SortedSet<int>>();

			for (int i = 0; i < lines.Length; i++)
			{
				Match m = Regex.Match(lines[i], "[a-zA-Z0-9_а-яА-Я]+");

				while (m.Success)
				{
					try
					{
						result[m.Value].Add(i);
					}
					catch (KeyNotFoundException)
					{
						result.Add(m.Value, new SortedSet<int>());
						result[m.Value].Add(i);
					}

					m = m.NextMatch();
				}
			}

			return result;
		}

		/// <summary>
		/// The Main method
		/// </summary>
		/// <param name="args">Input args of programm</param>
		public static void Main(string[] args)
		{
			string input = File.ReadAllText("text.txt");
			SortedDictionary<string, SortedSet<int>> result = Inclusion(input);

			for (int i = 0; i < result.Keys.Count; i++)
			{
				Console.Write("{0} : ", result.Keys.ElementAt(i));

				for (int j = 0; j < result[result.Keys.ElementAt(i)].Count; j++)
				{
					Console.Write("{0} ", result[result.Keys.ElementAt(i)].ElementAt(j));
				}

				Console.WriteLine();
			}
		}
	}
}
