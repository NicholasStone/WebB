package cn.blog.util;

import javax.servlet.http.HttpSession;

/**
 * Created by nicholas on 16-12-20.
 */
public class AlertMessage {

    public static final String ERROR_BOOL_KEY    = "error.bool";
    public static final String ERROR_MESSAGE_KEY = "error.message";
    public static final String ERROR_STACK_TRACE_KEY = "error.stackTrace";
    public static final String SUCCESS_BOOL_KEY = "success.bool";
    public static final String SUCCESS_MESSAGE_KEY = "success.message";

    public static void setErrorMessage(HttpSession session, String message) {
        session.setAttribute(ERROR_BOOL_KEY, "true");
        session.setAttribute(ERROR_MESSAGE_KEY, message);
    }

    public static void setSuccessMessage(HttpSession session, String message) {
        session.setAttribute(SUCCESS_BOOL_KEY, "true");
        session.setAttribute(SUCCESS_MESSAGE_KEY, message);
    }

    public static void setErrorStackTrace(HttpSession session, StackTraceElement[] stackTraceElements) {
        StringBuilder errorMessage = new StringBuilder();
        errorMessage.append("<pre>");
        for (StackTraceElement s : stackTraceElements) {
            errorMessage.append(s.toString()).append('\n');
        }
        errorMessage.append("<pre>");

        session.setAttribute(ERROR_BOOL_KEY, "true");
        session.setAttribute(ERROR_STACK_TRACE_KEY, errorMessage);
    }

    public static void unsetErrorMessage(HttpSession session) {
        if (session.getAttribute(ERROR_BOOL_KEY) != null) {
            session.setAttribute(ERROR_BOOL_KEY, null);
            session.setAttribute(ERROR_MESSAGE_KEY, null);
            session.setAttribute(ERROR_STACK_TRACE_KEY, null);
        }
    }

    public static void unsetSuccessMessage(HttpSession session) {
        if (session.getAttribute(SUCCESS_BOOL_KEY) != null) {
            session.setAttribute(SUCCESS_BOOL_KEY, null);
            session.setAttribute(SUCCESS_MESSAGE_KEY, null);
        }
    }

    public static boolean hasErrors(HttpSession session) {
        return session.getAttribute(ERROR_BOOL_KEY) != null && session.getAttribute(ERROR_BOOL_KEY).equals("true");
    }

    public static boolean hasSuccess(HttpSession session) {
        return session.getAttribute(SUCCESS_BOOL_KEY) != null && session.getAttribute(SUCCESS_BOOL_KEY).equals("true");
    }

    public static String getMessage(HttpSession session) {
        if (hasErrors(session)) {
            return session.getAttribute(ERROR_MESSAGE_KEY).toString();
        } else if (hasSuccess(session)) {
            return session.getAttribute(SUCCESS_MESSAGE_KEY).toString();
        }
        return "";
    }

    public static String getStackTrace(HttpSession session) {
        if (hasErrors(session)) {
            return session.getAttribute(ERROR_STACK_TRACE_KEY).toString();
        } else {
            return "";
        }
    }
}
