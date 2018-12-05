using System.Collections.Generic;
using System.Linq;

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
			int[] classes = GetClasses(automaton.FinalStates, table[0].Length);

			return RecursiveSearch(table, classes, 2);
		}

		private static int[] GetClasses(int[] finalStates, int countStates)
		{
			int[] classes = new int[countStates];

			for (int i = 0; i < countStates; i++)
			{
				classes[i] = 1;
			}

			foreach (int elem in finalStates)
			{
				classes[elem] = 0;
			}

			return classes;
		}
		
		private static int RecursiveSearch(int[][] table, int[] classes, int count)
		{
			Dictionary<int[], HashSet<int>> newClasses = CreateNewClasses(table, classes);
			int newCount = newClasses.Keys.Count;

			if (count == newCount)
			{
				return count;
			}

			for (int i = 0; i < newCount; i++)
			{
				HashSet<int> states = newClasses[newClasses.Keys.ElementAt(i)];

				for (int j = 0; j < states.Count; j++)
				{
					classes[states.ElementAt(j)] = i;
				}
			}

			return RecursiveSearch(table, classes, newCount);
		}

		private static Dictionary<int[], HashSet<int>> CreateNewClasses(int[][] table, int[] classes)
		{
			Dictionary<int[], HashSet<int>> newClasses = new Dictionary<int[], HashSet<int>>();

			for (int i = 0; i < classes.Length; i++)
			{
				int[] current = new int[1 + table.Length];
				current[0] = classes[i];

				for (int j = 0; j < table.Length; j++)
				{
					if (table[j][i] != error)
					{
						current[j + 1] = classes[table[j][i]];
					}
					else
					{
						current[j + 1] = error;
					}
				}

				try
				{
					newClasses[current].Add(i);
				}
				catch (KeyNotFoundException)
				{
					newClasses.Add(current, new HashSet<int>());
					newClasses[current].Add(i);
				}
			}

			return newClasses;
		}
	}
}
