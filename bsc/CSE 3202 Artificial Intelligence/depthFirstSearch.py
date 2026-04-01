# This is a DFS code by Saad Ahmed
graph = {
    '5': ['3', '7'],
    '3': ['2', '4'],
    '7': ['8'],
    '2': [],
    '8': [],
    '4': ['8']
}
# Declaring lists:
visited = []
stack = []
# Putting start node:
visited.append('5')
stack.append('5')
# Calculating path:
print("DFS Path:")
while stack:
    # POP parent from first of queue hence 0 as default pops from last:
    m = stack.pop()
    print(m, end=" ")
    # Takes each child and check is they are visited or not if not visited then add to queue and visited:
    for x in graph[m]:
        if x not in visited:
            stack.append(x)
            visited.append(x)
# End here