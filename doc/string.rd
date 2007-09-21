=begin
== string
string���g���ɂ́Astring.h�Ƃ����w�b�_�t�@�C�����C���N���[�h����B
  #include <cstl/string.h>
�ȉ��̃}�N����p���ăR�[�h��W�J����K�v������B

  /* �C���^�[�t�F�C�X��W�J */
  #define CSTL_STRING_INTERFACE(Name, Type)

  /* ������W�J */
  #define CSTL_STRING_IMPLEMENT(Name, Type)

Name�Ɋ����̌^�Əd�����Ȃ��C�ӂ̖��O���AType�ɔC�ӂ̕����̌^���w�肷��B
<<< br

CSTL_STRING_INTERFACE�̈�����Name��String, Type��CharT���w�肵���ꍇ�A
�ȉ��̃C���^�[�t�F�C�X��񋟂���B

==== �萔
  #define CSTL_NPOS  ((size_t)-1)
* size_t�^�̍ő�l�B
* �����֐��ɂ����āA�����Ɏ��s�������ɕԂ����B
* CharT *cstr, size_t cstr_len�Ƃ����֐��̈����ɂ����āAcstr_len��CSTL_NPOS���w�肵���ꍇ�Acstr��C�̕�����Ƃ��Ĉ�����B

==== �^

  String
�R���e�i�̌^�B���ۃf�[�^�^�ƂȂ��Ă���A�ȉ��̊֐��ɂ���Ă̂݃A�N�Z�X�ł���B

==== �֐�
�ȉ��̊֐��ɂ����āAString*�^�̈�����NULL�łȂ����Ƃ����O�����Ɋ܂߂�B

+ ����
  String *String_new(size_t n);
* ���e��(�����������̍Ċ��蓖�Ă��s�킸�Ɋi�[�ł��镶����)��n��string�𐶐�����B
* �����ɐ��������ꍇ�A���̃I�u�W�F�N�g�ւ̃|�C���^��Ԃ��B
* �������s���̏ꍇ�ANULL��Ԃ��B
<<< br

+ �j��
  void String_delete(String *self);
* self�̂��ׂĂ̕������폜���Aself��j������B
<<< br

+ �T�C�Y
  size_t String_size(String *self);
* self�̌��݂̕�������Ԃ��BString_length(self)�Ɠ����ł���B
<<< br

  size_t String_length(String *self);
* self�̌��݂̕�������Ԃ��BString_size(self)�Ɠ����ł���B
<<< br

  int String_empty(String *self);
* self����̏ꍇ�A0�ȊO�̒l��Ԃ��B
* self����łȂ��ꍇ�A0��Ԃ��B
<<< br

+ ���e��
  size_t String_capacity(String *self);
* self�̋��e�ʂ�Ԃ��B
<<< br

  int String_reserve(String *self, size_t n);
* self�̋��e�ʂ𕶎�n�̗̈�Ɋg������B
* self���������͈ێ�����A�g�������̈�̏������͂��Ȃ��B
* �g���ɐ��������ꍇ�A0�ȊO�̒l��Ԃ��B
* n��self�̌��݂̋��e�ʈȉ��̏ꍇ�Aself�̕ύX���s�킸0�ȊO�̒l��Ԃ��B
* �������s���̏ꍇ�Aself�̕ύX���s�킸0��Ԃ��B
<<< br

  void String_shrink(String *self, size_t n);
* self�̋��e�ʂ𕶎�n�̗̈�ɏk������B
* n��self�̌��݂̕������ȉ��̏ꍇ�Aself�̋��e�ʂ𕶎����Ɠ����ɂ���B
* n��self�̌��݂̋��e�ʈȏ�̏ꍇ�A�������Ȃ��B
<<< br

+ ��r
  int String_compare(String *self, String *x);
* self��x�̕�������r����B
* �����񂪓������ꍇ�A0��Ԃ��B
* self��x��莫�����ʂŏ������ꍇ�A���̒l��Ԃ��B
* self��x��莫�����ʂő傫���ꍇ�A���̒l��Ԃ��B
<<< br

+ �����̃A�N�Z�X
  CharT *String_at(String *self, size_t idx);
* self��idx�Ԗڂ̕����ւ̃|�C���^��Ԃ��B
* ���O����
  * idx��self�̌��݂̕�������菬�����l�ł��邱�ƁB
<<< br

  CharT *String_c_str(String *self);
* self�̕������'\0'�ŏI�[����C�̕�����Ƃ��ĕԂ��B
<<< br

+ ���
  int String_assign(String *self, CharT *cstr, size_t cstr_len);
* self��cstr�Ƃ��������̔z�񂩂�cstr_len�̕�����������B
* cstr_len��CSTL_NPOS�Ɠ������ꍇ�Acstr�Ƃ���C�̕������������B������cstr��'\0'�ŏI�[���Ă��Ȃ���΂Ȃ�Ȃ��B
* cstr��self���̕�����ł��悢�B
* ����ɐ��������ꍇ�A0�ȊO�̒l��Ԃ��B
* �������s���̏ꍇ�Aself�̕ύX���s�킸0��Ԃ��B
* ���O����
  * cstr��NULL�łȂ����ƁB
<<< br

  int String_assign_c(String *self, size_t n, CharT c);
* self��c�Ƃ���������n�������B
* ����ɐ��������ꍇ�A0�ȊO�̒l��Ԃ��B
* �������s���̏ꍇ�Aself�̕ύX���s�킸0��Ԃ��B
<<< br

  void String_swap(String *self, String *x);
* self��x�̓��e����������B
* �����̃R�s�[�����Ȃ��̂ŁAString_assign(self, String_c_str(x), String_size(x))���������B
  x���s�v�ɂȂ�ꍇ�A��������g�p����ׂ��ł���B
<<< br

+ �ǉ�
  int String_append(String *self, CharT *cstr, size_t cstr_len);
* self��cstr�Ƃ��������̔z�񂩂�cstr_len�̕�����ǉ�����B
* cstr_len��CSTL_NPOS�Ɠ������ꍇ�Acstr�Ƃ���C�̕������ǉ�����B������cstr��'\0'�ŏI�[���Ă��Ȃ���΂Ȃ�Ȃ��B
* cstr��self���̕�����ł��悢�B
* �ǉ��ɐ��������ꍇ�A0�ȊO�̒l��Ԃ��B
* �������s���̏ꍇ�Aself�̕ύX���s�킸0��Ԃ��B
* ���O����
  * cstr��NULL�łȂ����ƁB
<<< br

  int String_append_c(String *self, size_t n, CharT c);
* self��c�Ƃ���������n�ǉ�����B
* �ǉ��ɐ��������ꍇ�A0�ȊO�̒l��Ԃ��B
* �������s���̏ꍇ�Aself�̕ύX���s�킸0��Ԃ��B
<<< br

  int String_push_back(String *self, CharT c);
* self��c�Ƃ���������ǉ�����B
* �ǉ��ɐ��������ꍇ�A0�ȊO�̒l��Ԃ��B
* �������s���̏ꍇ�Aself�̕ύX���s�킸0��Ԃ��B
<<< br

+ �}��
  int String_insert(String *self, size_t idx, CharT *cstr, size_t cstr_len);
* self��idx�Ԗڂ̈ʒu��cstr�Ƃ��������̔z�񂩂�cstr_len�̕�����}������B
* cstr_len��CSTL_NPOS�Ɠ������ꍇ�Acstr�Ƃ���C�̕������}������B������cstr��'\0'�ŏI�[���Ă��Ȃ���΂Ȃ�Ȃ��B
* cstr��self���̕�����ł��悢�B
* �}���ɐ��������ꍇ�A0�ȊO�̒l��Ԃ��B
* �������s���̏ꍇ�Aself�̕ύX���s�킸0��Ԃ��B
* ���O����
  * cstr��NULL�łȂ����ƁB
  * idx��self�̕������ȉ��̒l�ł��邱�ƁB
<<< br

  int String_insert_c(String *self, size_t idx, size_t n, CharT c);
* self��idx�Ԗڂ̈ʒu��c�Ƃ���������n�}������B
* �}���ɐ��������ꍇ�A0�ȊO�̒l��Ԃ��B
* �������s���̏ꍇ�Aself�̕ύX���s�킸0��Ԃ��B
* ���O����
  * idx��self�̕������ȉ��̒l�ł��邱�ƁB
<<< br

+ �u��
  int String_replace(String *self, size_t idx, size_t len, CharT *cstr, size_t cstr_len);
* self��idx�Ԗڂ���ő�len�̕������Acstr�Ƃ��������̔z���cstr_len�̕����Œu������B
* cstr_len��CSTL_NPOS�Ɠ������ꍇ�Acstr�Ƃ���C�̕�����Œu������B������cstr��'\0'�ŏI�[���Ă��Ȃ���΂Ȃ�Ȃ��B
* cstr��self���̕�����ł��悢�B
* �u���ɐ��������ꍇ�A0�ȊO�̒l��Ԃ��B
* �������s���̏ꍇ�Aself�̕ύX���s�킸0��Ԃ��B
* ���O����
  * cstr��NULL�łȂ����ƁB
  * idx��self�̕������ȉ��̒l�ł��邱�ƁB
<<< br

  int String_replace_c(String *self, size_t idx, size_t len, size_t n, CharT c);
* self��idx�Ԗڂ���ő�len�̕������Ac�Ƃ�������n�Œu������B
* �u���ɐ��������ꍇ�A0�ȊO�̒l��Ԃ��B
* �������s���̏ꍇ�Aself�̕ύX���s�킸0��Ԃ��B
* ���O����
  * idx��self�̕������ȉ��̒l�ł��邱�ƁB
<<< br

+ �폜
  void String_erase(String *self, size_t idx, size_t len);
* self��idx�Ԗڂ̕�������ő�len�̕������폜����B
* ���O����
  * idx��self�̕������ȉ��̒l�ł��邱�ƁB
<<< br

  void String_clear(String *self);
* self�̂��ׂĂ̕������폜����B
<<< br

+ �T�C�Y�̕ύX
  int String_resize(String *self, size_t n, CharT c);
* self�̕�������n�ɕύX����B
* n��self�̌��݂̕������ȉ��̏ꍇ�A��������n�ɂȂ�܂Ŗ������當�����폜�����B
* n��self�̌��݂̕��������傫���ꍇ�A��������n�ɂȂ�܂�c�Ƃ�����������������ǉ������B
* �v�f���̕ύX�ɐ��������ꍇ�A0�ȊO�̒l��Ԃ��B
* �������s���̏ꍇ�Aself�̕ύX���s�킸0��Ԃ��B
<<< br

+ ����
  size_t String_find(CharT *x, CharT *cstr, size_t idx, size_t cstr_len);
* x�Ƃ���C�̕�����ɂ����āAidx�Ԗڂ���Acstr�Ƃ��������̔z���cstr_len�̕����������ŏ��̈ʒu��O�i���Č�������B
* cstr_len��CSTL_NPOS�Ɠ������ꍇ�Acstr�Ƃ���C�̕��������������B������cstr��'\0'�ŏI�[���Ă��Ȃ���΂Ȃ�Ȃ��B
* �����ɐ��������ꍇ�A������������������̍ŏ��̕����̃C���f�b�N�X��Ԃ��B
* �����Ɏ��s�����ꍇ�ACSTL_NPOS��Ԃ��B
* ���O����
  * x, cstr������NULL�łȂ����ƁB
<<< br

  size_t String_find_c(CharT *x, CharT c, size_t idx);
* x�Ƃ���C�̕�����ɂ����āAidx�Ԗڂ���Ac�Ƃ��������������ŏ��̈ʒu��O�i���Č�������B
* �����ɐ��������ꍇ�A���̕����̃C���f�b�N�X��Ԃ��B
* �����Ɏ��s�����ꍇ�ACSTL_NPOS��Ԃ��B
* ���O����
  * x��NULL�łȂ����ƁB
<<< br

  size_t String_rfind(CharT *x, CharT *cstr, size_t idx, size_t cstr_len);
* x�Ƃ���C�̕�����ɂ����āAidx�Ԗڂ���Acstr�Ƃ��������̔z���cstr_len�̕����������Ō�̈ʒu����ނ��Č�������B
* cstr_len��CSTL_NPOS�Ɠ������ꍇ�Acstr�Ƃ���C�̕��������������B������cstr��'\0'�ŏI�[���Ă��Ȃ���΂Ȃ�Ȃ��B
* �����ɐ��������ꍇ�A������������������̍ŏ��̕����̃C���f�b�N�X��Ԃ��B
* �����Ɏ��s�����ꍇ�ACSTL_NPOS��Ԃ��B
* ���O����
  * x, cstr������NULL�łȂ����ƁB
<<< br

  size_t String_rfind_c(CharT *x, CharT c, size_t idx);
* x�Ƃ���C�̕�����ɂ����āAidx�Ԗڂ���Ac�Ƃ��������������Ō�̈ʒu����ނ��Č�������B
* �����ɐ��������ꍇ�A���̕����̃C���f�b�N�X��Ԃ��B
* �����Ɏ��s�����ꍇ�ACSTL_NPOS��Ԃ��B
* ���O����
  * x��NULL�łȂ����ƁB
<<< br

  size_t String_find_first_of(CharT *x, CharT *cstr, size_t idx, size_t cstr_len);
* x�Ƃ���C�̕�����ɂ����āAidx�Ԗڂ���Acstr�Ƃ��������̔z���cstr_len�̕����Ɋ܂܂��ŏ��̕����������ʒu��O�i���Č�������B
* cstr_len��CSTL_NPOS�Ɠ������ꍇ�Acstr�Ƃ���C�̕�����Ɋ܂܂�镶������������B������cstr��'\0'�ŏI�[���Ă��Ȃ���΂Ȃ�Ȃ��B
* �����ɐ��������ꍇ�A���̕����̃C���f�b�N�X��Ԃ��B
* �����Ɏ��s�����ꍇ�ACSTL_NPOS��Ԃ��B
* ���O����
  * x, cstr������NULL�łȂ����ƁB
<<< br

  size_t String_find_first_of_c(CharT *x, CharT c, size_t idx);
* x�Ƃ���C�̕�����ɂ����āAidx�Ԗڂ���Ac�Ƃ��������������ŏ��̈ʒu��O�i���Č�������B
* �����ɐ��������ꍇ�A���̕����̃C���f�b�N�X��Ԃ��B
* �����Ɏ��s�����ꍇ�ACSTL_NPOS��Ԃ��B
* ���O����
  * x��NULL�łȂ����ƁB
<<< br

  size_t String_find_last_of(CharT *x, CharT *cstr, size_t idx, size_t cstr_len);
* x�Ƃ���C�̕�����ɂ����āAidx�Ԗڂ���Acstr�Ƃ��������̔z���cstr_len�̕����Ɋ܂܂��Ō�̕����������ʒu����ނ��Č�������B
* cstr_len��CSTL_NPOS�Ɠ������ꍇ�Acstr�Ƃ���C�̕�����Ɋ܂܂�镶������������B������cstr��'\0'�ŏI�[���Ă��Ȃ���΂Ȃ�Ȃ��B
* �����ɐ��������ꍇ�A���̕����̃C���f�b�N�X��Ԃ��B
* �����Ɏ��s�����ꍇ�ACSTL_NPOS��Ԃ��B
* ���O����
  * x, cstr������NULL�łȂ����ƁB
<<< br

  size_t String_find_last_of_c(CharT *x, CharT c, size_t idx);
* x�Ƃ���C�̕�����ɂ����āAidx�Ԗڂ���Ac�Ƃ��������������Ō�̈ʒu����ނ��Č�������B
* �����ɐ��������ꍇ�A���̕����̃C���f�b�N�X��Ԃ��B
* �����Ɏ��s�����ꍇ�ACSTL_NPOS��Ԃ��B
* ���O����
  * x��NULL�łȂ����ƁB
<<< br

  size_t String_find_first_not_of(CharT *x, CharT *cstr, size_t idx, size_t cstr_len);
* x�Ƃ���C�̕�����ɂ����āAidx�Ԗڂ���Acstr�Ƃ��������̔z���cstr_len�̕����Ɋ܂܂�Ȃ��ŏ��̕����������ʒu��O�i���Č�������B
* cstr_len��CSTL_NPOS�Ɠ������ꍇ�Acstr�Ƃ���C�̕�����Ɋ܂܂�Ȃ���������������B������cstr��'\0'�ŏI�[���Ă��Ȃ���΂Ȃ�Ȃ��B
* �����ɐ��������ꍇ�A���̕����̃C���f�b�N�X��Ԃ��B
* �����Ɏ��s�����ꍇ�ACSTL_NPOS��Ԃ��B
* ���O����
  * x, cstr������NULL�łȂ����ƁB
<<< br

  size_t String_find_first_not_of_c(CharT *x, CharT c, size_t idx);
* x�Ƃ���C�̕�����ɂ����āAidx�Ԗڂ���Ac�ȊO�̕����������ŏ��̈ʒu��O�i���Č�������B
* �����ɐ��������ꍇ�A���̕����̃C���f�b�N�X��Ԃ��B
* �����Ɏ��s�����ꍇ�ACSTL_NPOS��Ԃ��B
* ���O����
  * x��NULL�łȂ����ƁB
<<< br

  size_t String_find_last_not_of(CharT *x, CharT *cstr, size_t idx, size_t cstr_len);
* x�Ƃ���C�̕�����ɂ����āAidx�Ԗڂ���Acstr�Ƃ��������̔z���cstr_len�̕����Ɋ܂܂�Ȃ��Ō�̕����������ʒu����ނ��Č�������B
* cstr_len��CSTL_NPOS�Ɠ������ꍇ�Acstr�Ƃ���C�̕�����Ɋ܂܂�Ȃ���������������B������cstr��'\0'�ŏI�[���Ă��Ȃ���΂Ȃ�Ȃ��B
* �����ɐ��������ꍇ�A���̕����̃C���f�b�N�X��Ԃ��B
* �����Ɏ��s�����ꍇ�ACSTL_NPOS��Ԃ��B
* ���O����
  * x, cstr������NULL�łȂ����ƁB
<<< br

  size_t String_find_last_not_of_c(CharT *x, CharT c, size_t idx);
* x�Ƃ���C�̕�����ɂ����āAidx�Ԗڂ���Ac�ȊO�̕����������Ō�̈ʒu����ނ��Č�������B
* �����ɐ��������ꍇ�A���̕����̃C���f�b�N�X��Ԃ��B
* �����Ɏ��s�����ꍇ�ACSTL_NPOS��Ԃ��B
* ���O����
  * x��NULL�łȂ����ƁB
<<< br

=end
