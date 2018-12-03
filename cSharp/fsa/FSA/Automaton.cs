namespace FSA
{
	/// <summary>
	/// Finite-state automaton
	/// </summary>
	public class Automaton
	{
		private const int error = -1;
		private const int numbers = 10;
		private enum QState { Start, Minus, Number, Dot, Fraction, E, Sign, Degree, MaxState };
		private enum Symbols { Plus = 10, Minus, Dot, E, MaxSymbol };
		private readonly int[][] automaton;
		private readonly int[] finalState;

		/// <summary>
		/// Automaton constructor 
		/// </summary>
		public Automaton()
		{
			automaton = CreateMachine();
			finalState = CreateFinalStates();
		}

		/// <summary>
		/// Check word at the FSA
		/// </summary>
		/// <param name="word">Input word</param>
		/// <returns>Check result</returns>
		public bool CheckWord(string word)
		{
			int[] str = StringWordToInt(word);
			int q = 0;

			for (int i = 0; i < str.Length; i++)
			{
				q = automaton[str[i]][q];
				if (q == error)
				{
					return false;
				}
			}

			for (int i = 0; i < finalState.Length; i++)
			{
				if (q == finalState[i])
				{
					return true;
				}
			}

			return false;
		}

		protected int[][] CreateMachine()
		{
			int[][] machine = new int[(int)Symbols.MaxSymbol][];

			for (int i = 0; i < machine.Length; i++)
			{
				machine[i] = new int[(int)QState.MaxState];

				for (int j = 0; j < machine[i].Length; j++)
					machine[i][j] = error;
			}

			machine[(int)Symbols.Minus][(int)QState.Start] = 1;

			for (int i = 0; i < numbers; i++)
			{
				machine[i][(int)QState.Start] = (int)QState.Number;
				machine[i][(int)QState.Minus] = (int)QState.Number;
				machine[i][(int)QState.Number] = (int)QState.Number;
			}

			machine[(int)Symbols.Dot][(int)QState.Number] = (int)QState.Dot;


			for (int i = 0; i < numbers; i++)
			{
				machine[i][(int)QState.Dot] = (int)QState.Fraction;
				machine[i][(int)QState.Fraction] = (int)QState.Fraction;
			}

			machine[(int)Symbols.E][(int)QState.Number] = (int)QState.E;
			machine[(int)Symbols.E][(int)QState.Fraction] = (int)QState.E;

			machine[(int)Symbols.Plus][(int)QState.E] = (int)QState.Sign;
			machine[(int)Symbols.Minus][(int)QState.E] = (int)QState.Sign;

			for (int i = 0; i < numbers; i++)
			{
				machine[i][(int)QState.Sign] = (int)QState.Degree;
				machine[i][(int)QState.Degree] = (int)QState.Degree;
			}

			return machine;
		}

		protected int[] CreateFinalStates()
		{
			return new int[] { (int)QState.Number, (int)QState.Fraction, (int)QState.Degree };
		}

		private int[] StringWordToInt(string word)
		{
			int[] result = new int[word.Length];

			for (int i = 0; i < result.Length; i++)
			{
				switch (word[i])
				{
					case '+':
						result[i] = (int)Symbols.Plus;
						break;
					case '-':
						result[i] = (int)Symbols.Minus;
						break;
					case '.':
						result[i] = (int)Symbols.Dot;
						break;
					case 'e':
						result[i] = (int)Symbols.E;
						break;
					case 'E':
						result[i] = (int)Symbols.E;
						break;
					default:
						result[i] = word[i] - '0';
						break;
				}
			}

			return result;
		}
	}
}
