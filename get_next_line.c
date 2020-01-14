/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   get_next_line.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: nagresel <nagresel@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/01/13 11:26:58 by nagresel          #+#    #+#             */
/*   Updated: 2020/01/14 16:42:09 by nagresel         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "get_next_line.h"
#include <stdio.h>//A ENLEVER

int     ft_strlen(char *str)
{
    int i;

    i = 0;
    while (str[i])
        i++;
    return (i);
}

char    *ft_str_cut(char *line)
{
    char    *str;
    int     i;

	i = 0;
    if (!line)
		return (NULL);
    while (*line && *line != '\n')
        line++;
    if (!(*line))
        return (0);
    if (!(str = malloc(sizeof(*str) * (ft_strlen(line) + 1))))
        return (0);
    str[i] = '\0';
    return(str);
}

char    *ft_get_line(char *line)
{
    int i;

    i = 0;
    while (line[i])
    {
        if (line[i] == '\n')
            line[i] = '\0';
        i++;
    }
    return(line);
}

int     ft_str_has_return(char *str)
{
    // if (!str)
    //     return (0);
    int i;
 
    i = 0;
    while (str[i])
    {
        if (str[i] == '\n' || str[i] == '\0')
            return (1);
        i++;
    }
    return (0);
}
char    *ft_strjoin(char *line, char *buf)
{
    char    *str;
    char    *fline;
    int     i;
    int     j;

    fline = line;
    i = 0;
    j = 0;
    if (fline)
        i = ft_strlen(line);
    
    if (!(str = (char *)malloc(sizeof(*str) * (i + ft_strlen(buf) + 1))))
        return (0);
    i = 0;
    while (line && line[i])
    {
        str[i] = line[i];
        i++;
    }
    while (buf && buf[j])
    {
        str[i + j] = buf[j];
        j++;
    }
    str[i + j] = '\0';
    if (fline)
        free(fline);
    return (str);
}

int     get_next_line(char **line)
{
    char static *buf;
    int         readret;

    readret = 1;
    if (!(buf = (char *)malloc(sizeof(*buf) * 128)))
        return (-1);
    while ((ft_str_has_return(buf) == 0) && readret > 0)//&& (!*line || ft_str_has_return(*line) == 0) 
    {
        if ((readret = read(0, buf, 127)) < 0)
            return (-1);
        if (*buf == '\0') 
            buf[readret] = '\0';
            *line = ft_strjoin(*line, buf);
    }
    free(buf);
    buf = ft_str_cut(*line);
    *line = ft_get_line(*line);
    if (readret == 0)
    {
        free(buf);
        buf = NULL;
        return (0);
    }
    return (1);
}