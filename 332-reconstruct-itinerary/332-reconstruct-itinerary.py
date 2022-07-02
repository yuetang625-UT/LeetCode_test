class Solution(object):
    def findItinerary(self, tickets):
        """
        :type tickets: List[List[str]]
        :rtype: List[str]
        """
        tickets_dict=defaultdict(list)
        for item in tickets:
            tickets_dict[item[0]].append(item[1])
        path=['JFK']
        def backtracking(start_point):
            if len(path)==len(tickets)+1:
                return True
            tickets_dict[start_point].sort()
            for _ in tickets_dict[start_point]:
                end_point=tickets_dict[start_point].pop(0)
                path.append(end_point)
                if backtracking(end_point):
                    return True
                path.pop()
                tickets_dict[start_point].append(end_point)
        backtracking('JFK')
        return path