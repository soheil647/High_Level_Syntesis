
# Loop constraints
directive set /Convolotion/core/main CSTEPS_FROM {{. == 1}}
directive set /Convolotion/core/main/for CSTEPS_FROM {{. == 1} {.. == 1}}
directive set /Convolotion/core/main/for/for:for CSTEPS_FROM {{. == 1} {.. == 0}}
directive set /Convolotion/core/main/for/for:for/for:for:for CSTEPS_FROM {{. == 2} {.. == 0}}

# IO operation constraints

# Real operation constraints
directive set /Convolotion/core/main/for/for:for/for:for:for/for:for:for:for:acc#7 CSTEPS_FROM {{.. == 1}}
directive set /Convolotion/core/main/for/for:for/for:for:for/for:for:for:for:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /Convolotion/core/main/for/for:for/for:for:for/for:for:for:for:acc#8 CSTEPS_FROM {{.. == 1}}
directive set /Convolotion/core/main/for/for:for/for:for:for/for:for:for:for:acc#3 CSTEPS_FROM {{.. == 1}}
directive set /Convolotion/core/main/for/for:for/for:for:for/for:for:for:for:oelse#2:acc CSTEPS_FROM {{.. == 1}}
directive set /Convolotion/core/main/for/for:for/for:for:for/for:for:for:for:else:acc#6 CSTEPS_FROM {{.. == 1}}
directive set /Convolotion/core/main/for/for:for/for:for:for/for:for:for:for:else:acc#5 CSTEPS_FROM {{.. == 1}}
directive set /Convolotion/core/main/for/for:for/for:for:for/for:for:for:for:else:acc CSTEPS_FROM {{.. == 1}}
directive set /Convolotion/core/main/for/for:for/for:for:for/for:for:for:for:else:read_mem(in:rsc.d) CSTEPS_FROM {{.. == 1}}
directive set /Convolotion/core/main/for/for:for/for:for:for/for:for:for:for:else:mux CSTEPS_FROM {{.. == 1}}
directive set /Convolotion/core/main/for/for:for/for:for:for/for:for:for:for:else:mux#1 CSTEPS_FROM {{.. == 1}}
directive set /Convolotion/core/main/for/for:for/for:for:for/for:for:for:for:else:mul#1 CSTEPS_FROM {{.. == 2}}
directive set /Convolotion/core/main/for/for:for/for:for:for/for:for:for:for:else:acc#4 CSTEPS_FROM {{.. == 2}}
directive set /Convolotion/core/main/for/for:for/for:for:for/for:for:for:for:else:or CSTEPS_FROM {{.. == 2}}
directive set /Convolotion/core/main/for/for:for/for:for:for/for:for:for:for:mux#2 CSTEPS_FROM {{.. == 2}}
directive set /Convolotion/core/main/for/for:for/for:for:for/for:for:for:for:mux#3 CSTEPS_FROM {{.. == 2}}
directive set /Convolotion/core/main/for/for:for/for:for:for/for:for:for:for:mux#4 CSTEPS_FROM {{.. == 2}}
directive set /Convolotion/core/main/for/for:for/for:for:for/for:for:for:for:acc#6 CSTEPS_FROM {{.. == 1}}
directive set /Convolotion/core/main/for/for:for/for:for:for/for:for:for:for:acc CSTEPS_FROM {{.. == 1}}
directive set /Convolotion/core/main/for/for:for/for:for:for/for:for:for:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /Convolotion/core/main/for/for:for/for:for:for/for:for:for:acc CSTEPS_FROM {{.. == 1}}
directive set /Convolotion/core/main/for/for:for/for:for:for/for:for:for:for:and CSTEPS_FROM {{.. == 1}}
directive set /Convolotion/core/main/for/for:for/for:for:for/for:for:for:for:mux#9 CSTEPS_FROM {{.. == 1}}
directive set /Convolotion/core/main/for/for:for/for:for:for/for:for:for:for:mux#6 CSTEPS_FROM {{.. == 1}}
directive set /Convolotion/core/main/for/for:for/for:for:write_mem(out:rsc.d) CSTEPS_FROM {{.. == 0}}
directive set /Convolotion/core/main/for/for:for/for:for:acc#3 CSTEPS_FROM {{.. == 1}}
directive set /Convolotion/core/main/for/for:acc#1 CSTEPS_FROM {{.. == 1}}
