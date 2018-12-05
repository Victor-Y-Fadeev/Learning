using System;

namespace Test2
{
	/// <summary>
	/// The Program class
	/// </summary>
	public class Program
	{
		/// <summary>
		/// Find rectangle separation
		/// </summary>
		/// <param name="i">I size of rectangle</param>
		/// <param name="j">J size of rectangle</param>
		/// <returns>Count of separation</returns>
		private static int FindSeparation(int i, int j)
		{
			if (i > 1 && j > 1)
				return FindSeparation(i, 1) * FindSeparation(j, 1);

			if (j > 1)
				return FindSeparation(j, 1);

			if (i > 1)
				return FindSeparation(i - 1, 1) + i;

			return 1;
		}

		/// <summary>
		/// The Main method
		/// </summary>
		/// <param name="args">Input args of programm</param>
		public static void Main(string[] args)
		{
			Console.WriteLine("Separation of (5, 5) is " + FindSeparation(5, 5));
		}
	}
}
