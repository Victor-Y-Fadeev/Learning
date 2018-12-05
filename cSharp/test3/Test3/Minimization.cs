using System.Collections.Generic;

namespace Test3
{
	public static class Minimization
	{
		private const int error = -1;

		/// <summary>
		/// Minimize states of FSA
		/// </summary>
		/// <param name="automaton">Finite-state automaton</param>
		/// <returns>Count of states</returns>
		public static int MinimizeStates(IAutomaton automaton)
		{
			int[][] table = automaton.AutomatonTable;

			HashSet<int>[] classes = GetClasses(automaton.FinalStates, table[0].Length);
			HashSet<int>[] conversions = GetConversions(table);

			return RecursiveSearch(classes, conversions);
		}

		private static HashSet<int>[] GetClasses(int[] finalStates, int countStates)
		{
			HashSet<int>[] classes = new HashSet<int>[2];

			foreach (int elem in finalStates)
			{
				classes[0].Add(elem);
			}

			for (int i = 0; i < countStates; i++)
			{
				if (!classes[0].Contains(i))
				{
					classes[1].Add(i);
				}
			}

			return classes;
		}

		private static HashSet<int>[] GetConversions(int[][] table)
		{
			HashSet<int>[] conversions = new HashSet<int>[table[0].Length];

			for (int i = 0; i < conversions.Length; i++)
			{
				for (int j = 0; j < table.Length; j++)
				{
					if (table[j][i] != error)
					{
						conversions[i].Add(table[j][i]);
					}
				}
			}

			return conversions;
		}

		private static int RecursiveSearch(HashSet<int>[] classes, HashSet<int>[] conversions)
		{
			return 0;
		}
	}
}
