// Tyre McGee    //
#include <iostream>
#include <iomanip>
#include <cstdlib>

using namespace std;

int main()
{
    const int SIZE = 10;
    int a[SIZE] = {12,18,3,4,5,6,15,8,9,10};
    int choice,
        temp;

    cout << "Please select an option " << endl
        << "Press 1 to see the minimum number in the array. " << endl
        << "Press 2 to see the maximum number in the array. " << endl;
    cin >> choice;

    while (choice != 1 && choice != 2)
    {
        cout << "Please enter a valid choice. " << endl;
        cin >> choice;
    }

    if(choice == 2)
    {
        temp = a[0];
        for(int i = 0; i < SIZE; i++)
        {
            if(a[i] > temp)
            {
                temp = a[i];
            }
        }
        cout << "The highest value in the array is " << temp << endl;
    }

    if(choice == 1)
    {
        temp = a[0];
        for(int i = 0; i < SIZE; i++)
        {
            if(a[i] < temp)
            {
                temp = a[i];
            }
        }
        cout << "The lowest value in the array is " << temp << endl;
    }
    system("PAUSE>NUL");

    return 0;

}
