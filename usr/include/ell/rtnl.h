/*
 *
 *  Embedded Linux library
 *
 *  Copyright (C) 2019  Intel Corporation. All rights reserved.
 *
 *  This library is free software; you can redistribute it and/or
 *  modify it under the terms of the GNU Lesser General Public
 *  License as published by the Free Software Foundation; either
 *  version 2.1 of the License, or (at your option) any later version.
 *
 *  This library is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *  Lesser General Public License for more details.
 *
 *  You should have received a copy of the GNU Lesser General Public
 *  License along with this library; if not, write to the Free Software
 *  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */

#ifndef __ELL_RTNL_H
#define __ELL_RTNL_H

#include <stdint.h>
#include <linux/rtnetlink.h>

#ifdef __cplusplus
extern "C" {
#endif

uint32_t l_rtnl_set_linkmode_and_operstate(struct l_netlink *rtnl, int ifindex,
					uint8_t linkmode, uint8_t operstate,
					l_netlink_command_func_t cb,
					void *user_data,
					l_netlink_destroy_func_t destroy);

uint32_t l_rtnl_set_mac(struct l_netlink *rtnl, int ifindex,
					const uint8_t addr[static 6],
					bool power_up,
					l_netlink_command_func_t cb,
					void *user_data,
					l_netlink_destroy_func_t destroy);

uint32_t l_rtnl_set_powered(struct l_netlink *rtnl, int ifindex, bool powered,
				l_netlink_command_func_t cb, void *user_data,
				l_netlink_destroy_func_t destroy);

void l_rtnl_ifaddr4_extract(const struct ifaddrmsg *ifa, int bytes,
				char **label, char **ip, char **broadcast);
uint32_t l_rtnl_ifaddr4_dump(struct l_netlink *rtnl, l_netlink_command_func_t cb,
				void *user_data,
				l_netlink_destroy_func_t destroy);
uint32_t l_rtnl_ifaddr4_add(struct l_netlink *rtnl, int ifindex,
				uint8_t prefix_len, const char *ip,
				const char *broadcast,
				l_netlink_command_func_t cb, void *user_data,
				l_netlink_destroy_func_t destroy);
uint32_t l_rtnl_ifaddr4_delete(struct l_netlink *rtnl, int ifindex,
				uint8_t prefix_len, const char *ip,
				const char *broadcast,
				l_netlink_command_func_t cb, void *user_data,
				l_netlink_destroy_func_t destroy);

void l_rtnl_route4_extract(const struct rtmsg *rtmsg, uint32_t len,
				uint32_t *table, uint32_t *ifindex,
				char **dst, char **gateway, char **src);
uint32_t l_rtnl_route4_dump(struct l_netlink *rtnl,
				l_netlink_command_func_t cb, void *user_data,
				l_netlink_destroy_func_t destroy);
uint32_t l_rtnl_route4_add_connected(struct l_netlink *rtnl, int ifindex,
					uint8_t dst_len, const char *dst,
					const char *src, uint8_t proto,
					l_netlink_command_func_t cb,
					void *user_data,
					l_netlink_destroy_func_t destroy);
uint32_t l_rtnl_route4_add_gateway(struct l_netlink *rtnl, int ifindex,
					const char *gateway, const char *src,
					uint32_t priority_offset,
					uint8_t proto,
					l_netlink_command_func_t cb,
					void *user_data,
					l_netlink_destroy_func_t destroy);

void l_rtnl_ifaddr6_extract(const struct ifaddrmsg *ifa, int bytes,
								char **ip);
uint32_t l_rtnl_ifaddr6_dump(struct l_netlink *rtnl,
				l_netlink_command_func_t cb,
				void *user_data,
				l_netlink_destroy_func_t destroy);
uint32_t l_rtnl_ifaddr6_add(struct l_netlink *rtnl, int ifindex,
				uint8_t prefix_len, const char *ip,
				l_netlink_command_func_t cb, void *user_data,
				l_netlink_destroy_func_t destroy);
uint32_t l_rtnl_ifaddr6_delete(struct l_netlink *rtnl, int ifindex,
					uint8_t prefix_len, const char *ip,
					l_netlink_command_func_t cb,
					void *user_data,
					l_netlink_destroy_func_t destroy);
void l_rtnl_route6_extract(const struct rtmsg *rtmsg, uint32_t len,
				uint32_t *table, uint32_t *ifindex,
				char **dst, char **gateway, char **src);
uint32_t l_rtnl_route6_dump(struct l_netlink *rtnl,
				l_netlink_command_func_t cb, void *user_data,
				l_netlink_destroy_func_t destroy);
uint32_t l_rtnl_route6_add_gateway(struct l_netlink *rtnl, int ifindex,
					const char *gateway,
					uint32_t priority_offset,
					uint8_t proto,
					l_netlink_command_func_t cb,
					void *user_data,
					l_netlink_destroy_func_t destroy);
uint32_t l_rtnl_route6_delete_gateway(struct l_netlink *rtnl, int ifindex,
					const char *gateway,
					uint32_t priority_offset,
					uint8_t proto,
					l_netlink_command_func_t cb,
					void *user_data,
					l_netlink_destroy_func_t destroy);

#ifdef __cplusplus
}
#endif

#endif /* __ELL_RTNL_H */
