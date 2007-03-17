/* 
 * Copyright (c) 2006, KATO Noriaki
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without 
 * modification, are permitted provided that the following conditions are met:
 * 
 * 1. Redistributions of source code must retain the above copyright notice, 
 *    this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright notice, 
 *    this list of conditions and the following disclaimer in the documentation 
 *    and/or other materials provided with the distribution.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR 
 * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES 
 * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. 
 * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, 
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; 
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, 
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR 
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF 
 * ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
/*! 
 * \file list.h
 * \brief listコンテナ
 * \author KATO Noriaki <katono@users.sourceforge.jp>
 * \date 2006-02-26
 */
#ifndef CSTL_LIST_H_INCLUDED
#define CSTL_LIST_H_INCLUDED

#include <stddef.h>
#include <stdlib.h>
#include <assert.h>

#ifdef __cplusplus
#define LIST_BEGIN_EXTERN_C()	extern "C" {
#define LIST_END_EXTERN_C()		}
#else
#define LIST_BEGIN_EXTERN_C()
#define LIST_END_EXTERN_C()
#endif

#ifndef NDEBUG
#define LIST_MAGIC(x) x
#else
#define LIST_MAGIC(x)
#endif

/*! 
 * \brief インターフェイスマクロ
 * 
 * \param Name コンテナ名
 * \param Type 要素の型
 */
#define LIST_INTERFACE(Name, Type)	\
typedef struct Name##_t Name;\
/*! 
 * \brief イテレータ
 */\
typedef struct Name##Node_t *Name##Iterator;\
\
LIST_BEGIN_EXTERN_C()\
Name *Name##_new(void);\
void Name##_delete(Name *self);\
int Name##_assign(Name *self, Name##Iterator first, Name##Iterator last);\
int Name##_assign_array(Name *self, Type *elems, size_t n);\
int Name##_push_back(Name *self, Type elem);\
int Name##_push_front(Name *self, Type elem);\
Type Name##_pop_front(Name *self);\
Type Name##_pop_back(Name *self);\
int Name##_empty(Name *self);\
size_t Name##_size(Name *self);\
void Name##_clear(Name *self);\
Type *Name##_at(Name##Iterator pos);\
Type Name##_front(Name *self);\
Type Name##_back(Name *self);\
Name##Iterator Name##_begin(Name *self);\
Name##Iterator Name##_end(Name *self);\
Name##Iterator Name##_rbegin(Name *self);\
Name##Iterator Name##_rend(Name *self);\
Name##Iterator Name##_next(Name##Iterator pos);\
Name##Iterator Name##_prev(Name##Iterator pos);\
Name##Iterator Name##_insert(Name *self, Name##Iterator pos, Type elem);\
Name##Iterator Name##_erase(Name *self, Name##Iterator pos);\
Name##Iterator Name##_erase_range(Name *self, Name##Iterator first, Name##Iterator last);\
int Name##_resize(Name *self, size_t n, Type elem);\
void Name##_swap(Name *x, Name *y);\
LIST_END_EXTERN_C()\


/*! 
 * \brief 実装マクロ
 * 
 * \param Name コンテナ名
 * \param Type 要素の型
 */
#define LIST_IMPLEMENT(Name, Type)	\
typedef struct Name##Node_t Name##Node;\
/*! 
 * \brief listノード構造体
 */\
struct Name##Node_t {\
	Name##Node *prev;\
	Name##Node *next;\
	Type elem;\
};\
\
/*! 
 * \brief list構造体
 */\
struct Name##_t {\
	Name##Node *terminator;\
	size_t nelems;\
	LIST_MAGIC(void *magic;)\
};\
\
Name *Name##_new(void)\
{\
	Name *self = (Name *) malloc(sizeof(Name));\
	if (!self) return 0;\
	self->terminator = (Name##Node *) malloc(sizeof(Name##Node));\
	if (!self->terminator) {\
		free(self);\
		return 0;\
	}\
	self->terminator->next = self->terminator;\
	self->terminator->prev = self->terminator;\
	self->nelems = 0;\
	LIST_MAGIC(self->magic = self);\
	return self;\
}\
\
void Name##_delete(Name *self)\
{\
	assert(self && "List_delete");\
	assert(self->magic == self && "List_delete");\
	Name##_clear(self);\
	LIST_MAGIC(self->magic = 0);\
	free(self->terminator);\
	free(self);\
}\
\
int Name##_assign(Name *self, Name##Iterator first, Name##Iterator last)\
{\
	Name##Iterator pos;\
	assert(self && "List_assign");\
	assert(self->magic == self && "List_assign");\
	assert(first && "List_assign");\
	assert(last && "List_assign");\
	Name##_clear(self);\
	for (pos = first; pos != last; pos = Name##_next(pos)) {\
		if (!Name##_push_back(self, *Name##_at(pos))) {\
			return 0;\
		}\
	}\
	return 1;\
}\
\
int Name##_assign_array(Name *self, Type *elems, size_t n)\
{\
	size_t i;\
	assert(self && "List_assign_array");\
	assert(self->magic == self && "List_assign_array");\
	assert(elems && "List_assign_array");\
	Name##_clear(self);\
	for (i = 0; i < n; i++) {\
		if (!Name##_push_back(self, elems[i])) return 0;\
	}\
	return 1;\
}\
\
int Name##_push_back(Name *self, Type elem)\
{\
	Name##Node *node;\
	assert(self && "List_push_back");\
	assert(self->magic == self && "List_push_back");\
	node = (Name##Node *) malloc(sizeof(Name##Node));\
	if (!node) return 0;\
	node->elem = elem;\
	node->next = self->terminator;\
	node->prev = self->terminator->prev;\
	self->terminator->prev->next = node;\
	self->terminator->prev = node;\
	self->nelems++;\
	return 1;\
}\
\
int Name##_push_front(Name *self, Type elem)\
{\
	Name##Node *node;\
	assert(self && "List_push_front");\
	assert(self->magic == self && "List_push_front");\
	node = (Name##Node *) malloc(sizeof(Name##Node));\
	if (!node) return 0;\
	node->elem = elem;\
	node->next = self->terminator->next;\
	node->prev = self->terminator;\
	self->terminator->next->prev = node;\
	self->terminator->next = node;\
	self->nelems++;\
	return 1;\
}\
\
Type Name##_pop_front(Name *self)\
{\
	Name##Node *node;\
	Type elem;\
	assert(self && "List_pop_front");\
	assert(self->magic == self && "List_pop_front");\
	assert(!Name##_empty(self) && "List_pop_front");\
	node = self->terminator->next;\
	elem = node->elem;\
	self->terminator->next = node->next;\
	node->next->prev = self->terminator;\
	free(node);\
	self->nelems--;\
	return elem;\
}\
\
Type Name##_pop_back(Name *self)\
{\
	Name##Node *node;\
	Type elem;\
	assert(self && "List_pop_back");\
	assert(self->magic == self && "List_pop_back");\
	assert(!Name##_empty(self) && "List_pop_back");\
	node = self->terminator->prev;\
	elem = node->elem;\
	self->terminator->prev = node->prev;\
	node->prev->next = self->terminator;\
	free(node);\
	self->nelems--;\
	return elem;\
}\
\
int Name##_empty(Name *self)\
{\
	assert(self && "List_empty");\
	assert(self->magic == self && "List_empty");\
	return self->terminator->next == self->terminator;\
}\
\
size_t Name##_size(Name *self)\
{\
	assert(self && "List_size");\
	assert(self->magic == self && "List_size");\
	return self->nelems;\
}\
\
void Name##_clear(Name *self)\
{\
	assert(self && "List_clear");\
	assert(self->magic == self && "List_clear");\
	Name##_erase_range(self, Name##_begin(self), Name##_end(self));\
}\
\
Type *Name##_at(Name##Iterator pos)\
{\
	assert(pos && "List_at");\
	return &pos->elem;\
}\
\
Type Name##_front(Name *self)\
{\
	assert(self && "List_front");\
	assert(self->magic == self && "List_front");\
	assert(!Name##_empty(self) && "List_front");\
	return self->terminator->next->elem;\
}\
\
Type Name##_back(Name *self)\
{\
	assert(self && "List_back");\
	assert(self->magic == self && "List_back");\
	assert(!Name##_empty(self) && "List_back");\
	return self->terminator->prev->elem;\
}\
\
Name##Iterator Name##_begin(Name *self)\
{\
	assert(self && "List_begin");\
	assert(self->magic == self && "List_begin");\
	return self->terminator->next;\
}\
\
Name##Iterator Name##_end(Name *self)\
{\
	assert(self && "List_end");\
	assert(self->magic == self && "List_end");\
	return self->terminator;\
}\
\
Name##Iterator Name##_rbegin(Name *self)\
{\
	assert(self && "List_rbegin");\
	assert(self->magic == self && "List_rbegin");\
	return self->terminator->prev;\
}\
\
Name##Iterator Name##_rend(Name *self)\
{\
	assert(self && "List_rend");\
	assert(self->magic == self && "List_rend");\
	return self->terminator;\
}\
\
Name##Iterator Name##_next(Name##Iterator pos)\
{\
	assert(pos && "List_next");\
	return pos->next;\
}\
\
Name##Iterator Name##_prev(Name##Iterator pos)\
{\
	assert(pos && "List_prev");\
	return pos->prev;\
}\
\
Name##Iterator Name##_insert(Name *self, Name##Iterator pos, Type elem)\
{\
	Name##Node *node;\
	assert(self && "List_insert");\
	assert(self->magic == self && "List_insert");\
	assert(pos && "List_insert");\
	node = (Name##Node *) malloc(sizeof(Name##Node));\
	if (!node) return 0;\
	node->elem = elem;\
	node->next = pos;\
	node->prev = pos->prev;\
	pos->prev = node;\
	node->prev->next = node;\
	self->nelems++;\
	return node;\
}\
\
Name##Iterator Name##_erase(Name *self, Name##Iterator pos)\
{\
	Name##Node *node;\
	assert(self && "List_erase");\
	assert(self->magic == self && "List_erase");\
	assert(pos && "List_erase");\
	assert(pos != self->terminator && "List_erase");\
	assert(!Name##_empty(self) && "List_erase");\
	node = pos->next;\
	pos->prev->next = pos->next;\
	pos->next->prev = pos->prev;\
	free(pos);\
	self->nelems--;\
	return node;\
}\
\
Name##Iterator Name##_erase_range(Name *self, Name##Iterator first, Name##Iterator last)\
{\
	Name##Iterator pos;\
	assert(self && "List_erase_range");\
	assert(self->magic == self && "List_erase_range");\
	assert(first && "List_erase_range");\
	assert(last && "List_erase_range");\
	pos = first;\
	while (pos != last) {\
		assert(!Name##_empty(self) && "List_erase_range");\
		pos = Name##_erase(self, pos);\
	}\
	return pos;\
}\
\
int Name##_resize(Name *self, size_t n, Type elem)\
{\
	size_t i;\
	size_t size;\
	assert(self && "List_resize");\
	assert(self->magic == self && "List_resize");\
	size = Name##_size(self);\
	if (size >= n) {\
		for (i = 0; i < size - n; i++) {\
			Name##_erase(self, Name##_rbegin(self));\
		}\
	} else {\
		for (i = 0; i < n - size; i++) {\
			if (!Name##_push_back(self, elem)) return 0;\
		}\
	}\
	return 1;\
}\
\
void Name##_swap(Name *x, Name *y)\
{\
	Name##Node *tmp_terminator;\
	size_t tmp_nelems;\
	assert(x && "List_swap");\
	assert(y && "List_swap");\
	assert(x->magic == x && "List_swap");\
	assert(y->magic == y && "List_swap");\
	tmp_terminator = x->terminator;\
	tmp_nelems = x->nelems;\
	x->terminator = y->terminator;\
	x->nelems = y->nelems;\
	y->terminator = tmp_terminator;\
	y->nelems = tmp_nelems;\
}\
\


#endif /* CSTL_LIST_H_INCLUDED */
