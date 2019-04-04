#include <iostream>
#include <vector>
#include <unistd.h>
#include <unordered_map>

int main()
{
    std::vector<int> vecContainer;
    std::unordered_map<int, int> mapContainer;
    
    std::cout << "Hello, world" << std::endl;
    for(int i = 0; i < 9999; i++)
    {
        vecContainer.push_back(i);
        mapContainer[i] = i * 100;
        std::cout << "Hello " << i << std::endl;
        sleep(5);
    }
}