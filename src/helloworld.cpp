/**
 * @file helloworld.cpp
 * @brief VSCode template
 * @author gcogoh@users.noreply.github.com
 * @date 2020/08/08 create
 */
#include <iostream>
#include <vector>
#include <string>

using namespace std;

int main()
{
	vector<string> msg {"Hello", "C++", "World", "from", "VS Code", "and the C++ extension!", "by GCC"};

	for (const string& word : msg)
	{
		cout << word << " ";
		cout << flush;
	}
	cout << endl;

	return 0;
}