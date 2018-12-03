using System;

namespace Homework2
{
	/// <summary>
	/// Class for renumbering pair of numbers
	/// </summary>
	public static class Numbering
	{
		/// <summary>
		/// K-numbering
		/// </summary>
		/// <param name="i">I-coordinate</param>
		/// <param name="j">J-coordinate</param>
		/// <returns>K-number of pair</returns>
		public static int KNumbering(int i, int j)
		{
			return j + (i + j - 1) * (i + j - 2) / 2;
		}

		/// <summary>
		/// Reverse K-number to J-coordinate
		/// </summary>
		/// <param name="k">K-number</param>
		/// <returns>J-coordinate</returns>
		public static int JReverse(int k)
		{
			int n = (int) Math.Ceiling(Math.Sqrt(2 * k + 0.25) - 0.5) - 1;

			return k - n * (n + 1) / 2;
		}

		/// <summary>
		/// Reverse K-number to I-coordinate
		/// </summary>
		/// <param name="k">K-number</param>
		/// <returns>I-coordinate</returns>
		public static int IReverse(int k)
		{
			int n = (int) Math.Ceiling(Math.Sqrt(2 * k + 0.25) - 0.5) - 1;

			int j = k - n * (n + 1) / 2;

			return n - j + 2;
		}

		/// <summary>
		/// Reverse сonvolution triple of numbers
		/// </summary>
		/// <param name="k">K-number</param>
		/// <returns>Array of W, X, Y coordinates</returns>
		public static int[] Сonvolution(int k)
		{
			int j = JReverse(k);

			return new int[3] { IReverse(k), IReverse(j), JReverse(j) };
		}

		/// <summary>
		/// Numbering word by K-numbering
		/// </summary>
		/// <param name="word">Numbering word</param>
		/// <returns>Number</returns>
		public static int WordNumbering(string word)
		{
			if (word.Equals(""))
			{
				return 1;
			}

			int size = word.Length;
			int alphabet = 'z' - 'a' + 1;
			int prev = (int) (1 - Math.Pow(alphabet, size)) / (1 - alphabet);
			int num = word[size - 1] - 'a' + 1;

			for (int i = size - 2; i >= 0; i--)
			{
				num = KNumbering(word[i] - 'a' + 1, num);
			}

			return prev + num;
		}
	}
}
