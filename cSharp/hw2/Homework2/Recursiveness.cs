namespace Homework2
{
	/// <summary>
	/// Check set is recursive 
	/// </summary>
	public static class Recursiveness
	{
		private static int f(int x)
		{
			return 2 * x;
		}

		/// <summary>
		/// Check number inclusion to monotone set
		/// </summary>
		/// <param name="num">Number</param>
		/// <returns>Is number in set</returns>
		public static bool IsNumberInSet(int num)
		{
			int i = 0;

			while (f(i) < num)
			{
				i++;
			}

			return f(i) == num;
		}

		/// <summary>
		/// Check number inclusion to array
		/// </summary>
		/// <param name="arr">Array</param>
		/// <param name="num">Number</param>
		/// <returns>Is number in array</returns>
		public static bool IsNumberInArray(int[] arr,int num)
		{
			for (int i = 0; i < arr.Length; i++)
			{
				if (arr[i] == num)
				{
					return true;
				}
			}

			return false;
		}
	}
}
