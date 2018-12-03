using System;
using System.Collections.Generic;
using System.Linq;

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
				string[] words = lines[i].Split(' ');

				for (int j = 0; j < words.Length; j++)
				{
					try
					{
						result[words[j]].Add(i);
					}
					catch (KeyNotFoundException)
					{
						result.Add(words[j], new SortedSet<int>());
						result[words[j]].Add(i);
					}
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
			SortedDictionary<string, SortedSet<int>> result = Inclusion("i d d\nd a c\na b a");

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
