package com.jzy.manager.exception;

/**
 * @ClassName InvalidPhoneException
 * @Author JinZhiyun
 * @Description 不合法的手机号的异常
 * @Date 2019/12/30 17:35
 * @Version 1.0
 **/
public class InvalidPhoneException extends InvalidParameterException {
    private static final long serialVersionUID = 8632987042944636323L;

    public InvalidPhoneException() {
    }

    public InvalidPhoneException(String message) {
        super(message);
    }
}
