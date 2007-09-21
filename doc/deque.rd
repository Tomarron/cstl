=begin
== deque
deque���g���ɂ́Adeque.h�Ƃ����w�b�_�t�@�C�����C���N���[�h����B
  #include <cstl/deque.h>

�ȉ��̃}�N����p���ăR�[�h��W�J����K�v������B

  /* �C���^�[�t�F�C�X��W�J */
  #define CSTL_DEQUE_INTERFACE(Name, Type)

  /* ������W�J */
  #define CSTL_DEQUE_IMPLEMENT(Name, Type)

Name�Ɋ����̌^�Əd�����Ȃ��C�ӂ̖��O���AType�ɔC�ӂ̗v�f�̌^���w�肷��B
<<< br

CSTL_DEQUE_INTERFACE�̈�����Name��Deque, Type��T���w�肵���ꍇ�A
�ȉ��̃C���^�[�t�F�C�X��񋟂���B

==== �^

  Deque
�R���e�i�̌^�B���ۃf�[�^�^�ƂȂ��Ă���A�ȉ��̊֐��ɂ���Ă̂݃A�N�Z�X�ł���B

==== �֐�
�ȉ��̊֐��ɂ����āADeque*�^�̈�����NULL�łȂ����Ƃ����O�����Ɋ܂߂�B

+ ����
  Deque *Deque_new(void);
* deque�𐶐�����B
* �����ɐ��������ꍇ�A���̃I�u�W�F�N�g�ւ̃|�C���^��Ԃ��B
* �������s���̏ꍇ�ANULL��Ԃ��B
<<< br

+ �j��
  void Deque_delete(Deque *self);
* self�̂��ׂĂ̗v�f���폜���Aself��j������B
<<< br

+ �T�C�Y
  size_t Deque_size(Deque *self);
* self�̌��݂̗v�f����Ԃ��B
<<< br

  int Deque_empty(Deque *self);
* self����̏ꍇ�A0�ȊO�̒l��Ԃ��B
* self����łȂ��ꍇ�A0��Ԃ��B
<<< br

+ ���
  int Deque_assign(Deque *self, Deque *x, size_t idx, size_t n);
* x��idx�Ԗڂ���n�̗v�f�̃R�s�[��self�̗v�f�Ƃ��đ������B
* self��x�͓����I�u�W�F�N�g�ł��悢�B
* ����ɐ��������ꍇ�A0�ȊO�̒l��Ԃ��B
* �������s���̏ꍇ�Aself�̕ύX���s�킸0��Ԃ��B
* ���O����
  * idx + n��x�̌��݂̗v�f���ȉ��̒l�ł��邱�ƁB
<<< br

  void Deque_swap(Deque *self, Deque *x);
* self��x�̓��e����������B
* �v�f�̃R�s�[�����Ȃ��̂ŁADeque_assign(self, x, 0, Deque_size(x))���������B
  x���s�v�ɂȂ�ꍇ�A��������g�p����ׂ��ł���B
<<< br

+ �v�f�̃A�N�Z�X
  T *Deque_at(Deque *self, size_t idx);
* self��idx�Ԗڂ̗v�f�ւ̃|�C���^��Ԃ��B
* ���O����
  * idx��self�̌��݂̗v�f����菬�����l�ł��邱�ƁB
<<< br

  T Deque_front(Deque *self);
* self�̍ŏ��̗v�f��Ԃ��B
* ���O����
  * self����łȂ����ƁB
<<< br

  T Deque_back(Deque *self);
* self�̍Ō�̗v�f��Ԃ��B
* ���O����
  * self����łȂ����ƁB
<<< br

+ �}��
  int Deque_insert(Deque *self, size_t idx, T elem);
* self��idx�Ԗڂ̈ʒu��elem�̃R�s�[��}������B
* �}���ɐ��������ꍇ�A0�ȊO�̒l��Ԃ��B
* �������s���̏ꍇ�Aself�̕ύX���s�킸0��Ԃ��B
* ���O����
  * idx��self�̌��݂̗v�f���ȉ��̒l�ł��邱�ƁB
<<< br

  int Deque_insert_n(Deque *self, size_t idx, size_t n, T elem);
* self��idx�Ԗڂ̈ʒu��elem�̃R�s�[��n�}������B
* �}���ɐ��������ꍇ�A0�ȊO�̒l��Ԃ��B
* �������s���̏ꍇ�Aself�̕ύX���s�킸0��Ԃ��B
* ���O����
  * idx��self�̌��݂̗v�f���ȉ��̒l�ł��邱�ƁB
<<< br

  int Deque_insert_array(Deque *self, size_t idx, T *elems, size_t n);
* self��idx�Ԗڂ̈ʒu��elems�Ƃ����z�񂩂�n�̗v�f�̃R�s�[��}������B
* �}���ɐ��������ꍇ�A0�ȊO�̒l��Ԃ��B
* �������s���̏ꍇ�Aself�̕ύX���s�킸0��Ԃ��B
* ���O����
  * elems��NULL�łȂ����ƁB
  * idx��self�̌��݂̗v�f���ȉ��̒l�ł��邱�ƁB
<<< br

  int Deque_insert_range(Deque *self, size_t idx, Deque *x, size_t xidx, size_t n);
* self��idx�Ԗڂ̈ʒu��x��xidx�Ԗڂ���n�̗v�f�̃R�s�[��}������B
* self��x�͓����I�u�W�F�N�g�ł��悢�B
* �}���ɐ��������ꍇ�A0�ȊO�̒l��Ԃ��B
* �������s���̏ꍇ�Aself�̕ύX���s�킸0��Ԃ��B
* ���O����
  * xidx + n��x�̌��݂̗v�f���ȉ��̒l�ł��邱�ƁB
  * idx��self�̌��݂̗v�f���ȉ��̒l�ł��邱�ƁB
<<< br

  int Deque_push_back(Deque *self, T elem);
* elem�̃R�s�[��self�̍Ō�̗v�f�Ƃ��Ēǉ�����B
* �ǉ��ɐ��������ꍇ�A0�ȊO�̒l��Ԃ��B
* �������s���̏ꍇ�Aself�̕ύX���s�킸0��Ԃ��B
<<< br

  int Deque_push_front(Deque *self, T elem);
* elem�̃R�s�[��self�̍ŏ��̗v�f�Ƃ��Ēǉ�����B
* �ǉ��ɐ��������ꍇ�A0�ȊO�̒l��Ԃ��B
* �������s���̏ꍇ�Aself�̕ύX���s�킸0��Ԃ��B
<<< br

+ �폜
  void Deque_erase(Deque *self, size_t idx, size_t n);
* self��idx�Ԗڂ���n�̗v�f���폜����B
* ���O����
  * idx + n��self�̌��݂̗v�f���ȉ��̒l�ł��邱�ƁB
<<< br

  T Deque_pop_front(Deque *self);
* self�̍ŏ��̗v�f���폜���A���̗v�f��Ԃ��B
* ���O����
  * self����łȂ����ƁB
<<< br

  T Deque_pop_back(Deque *self);
* self�̍Ō�̗v�f���폜���A���̗v�f��Ԃ��B
* ���O����
  * self����łȂ����ƁB
<<< br

  void Deque_clear(Deque *self);
* self�̂��ׂĂ̗v�f���폜����B
<<< br

+ �T�C�Y�̕ύX
  int Deque_resize(Deque *self, size_t n, T elem);
* self�̗v�f����n�ɕύX����B
* n��self�̌��݂̗v�f���ȉ��̏ꍇ�A�v�f����n�ɂȂ�܂Ŗ�������v�f���폜�����B
* n��self�̌��݂̗v�f�����傫���ꍇ�A�v�f����n�ɂȂ�܂�elem�̃R�s�[����������ǉ������B
* �v�f���̕ύX�ɐ��������ꍇ�A0�ȊO�̒l��Ԃ��B
* �������s���̏ꍇ�Aself�̕ύX���s�킸0��Ԃ��B
<<< br

=end
