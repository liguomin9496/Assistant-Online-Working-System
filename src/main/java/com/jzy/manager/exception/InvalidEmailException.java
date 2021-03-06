package com.jzy.manager.exception;

/**
 * @ClassName InvalidEmailException
 * @Author JinZhiyun
 * @Description 不合法的邮箱格式
 * @Date 2019/12/30 9:59
 * @Version 1.0
 **/
public class InvalidEmailException extends InvalidParameterException {
    private static final long serialVersionUID = 7327152820328019248L;

    public InvalidEmailException() {
    }

    public InvalidEmailException(String message) {
        super(message);
    }
}
