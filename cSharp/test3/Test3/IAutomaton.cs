namespace Test3
{
	/// <summary>
	/// Interface of finite-state automaton
	/// </summary>
	public interface IAutomaton
	{
		/// <summary>
		/// Conversion table
		/// </summary>
		int[][] AutomatonTable { get; }
		/// <summary>
		/// Final states
		/// </summary>
		int[] FinalStates { get; }

		/// <summary>
		/// Check word at the FSA
		/// </summary>
		/// <param name="word">Input word</param>
		/// <returns>Check result</returns>
		bool CheckWord(string word);
	}
}
