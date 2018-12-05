namespace Test3
{
	/// <summary>
	/// Finite-state automaton example
	/// </summary>
	public class TestAutomaton : IAutomaton
	{
		public int[][] AutomatonTable => automaton;
		public int[] FinalStates => finalStates;
		private const int symbols = 5;
		private const int states = 7;
		private const int error = -1;
		private readonly int[][] automaton;
		private readonly int[] finalStates;

		/// <summary>
		/// Test automaton constructor 
		/// </summary>
		public TestAutomaton()
		{
			automaton = CreateMachine();
			finalStates = CreateFinalStates();
		}

		public bool CheckWord(string word)
		{
			return false;
		}

		protected int[][] CreateMachine()
		{
			int[][] machine = new int[symbols][];

			for (int i = 0; i < machine.Length; i++)
			{
				machine[i] = new int[states];

				for (int j = 0; j < machine[i].Length; j++)
				{
					machine[i][j] = error;
				}
			}

			machine[0][0] = 1;
			machine[0][1] = 1;
			machine[0][2] = 4;
			machine[0][3] = 5;
			machine[0][4] = 4;
			machine[0][5] = 5;
			machine[0][6] = 5;

			machine[1][1] = 2;
			machine[2][1] = 3;
			machine[2][4] = 3;
			machine[3][3] = 6;

			return machine;
		}

		protected int[] CreateFinalStates()
		{
			return new int[] { 1, 4, 5 };
		}
	}
}
