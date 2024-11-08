#pragma once

#include "globals.hpp"
#include "config.hpp"

template<typename T>
std::string numtos(const T x);

zrc_num stonum(std::string const& str);

#define ARR(x) zrc_arr& x = amap[#x];
#define VAR(x) zrc_obj& x = vmap[#x];

namespace vars
{
	std::unordered_map<std::string, zrc_obj> vmap;
	std::unordered_map<std::string, zrc_arr> amap;

	VAR(status) // Last return value
	VAR(argc)   // Argument count
	ARR(argv)   // Argument vector
}

static inline std::string getvar(std::string const& str);

static inline std::string setvar(std::string const& key, zrc_obj const& val);

static inline void unsetvar(std::string const& key);
