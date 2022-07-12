class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        total=0
        ts,tf=0,0
        hash_table=defaultdict(int)
        s_list=list(s)
        if len(s_list)==0: return total
        while tf<len(s_list):
            if s_list[tf] not in hash_table.keys() or hash_table[s_list[tf]]==0:
                hash_table[s_list[tf]] += 1
                tf+=1
            else:
                hash_table[s_list[ts]] -= 1
                ts+=1
            total=max(sum(hash_table.values()),total)
        return total
                    
                
                