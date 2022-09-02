Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29547E
	for <asahi@lists.linux.dev>; Fri,  2 Sep 2022 06:32:03 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id g21so1047720qka.5
        for <asahi@lists.linux.dev>; Thu, 01 Sep 2022 23:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=X4NcCxXF7k9Z1Trr19zd7vM5+qsrHkvjZK9Hyee90S0=;
        b=BN3eElpZfT+pMo2zikkEwGX5qeGEqtXq2eN6JhTPJ8qw1TJFRZAA9vb4xvMDby5vf2
         0K+N/s9Kx/1EUEXZDPpdvElig0nNis31cXoacbHjCFMc32a0sFrwITbxUU7W6mTyzwC6
         wFN+F+NWrwFp7xBI5SZWGnKn6vKeDt9iRZSI3QASh8OGXgAM4aALec+FnPsp8BJ/gA9S
         C9qC/+xSF6eMiGzWXMtB04XR9lI5aheOLJJ5j/aHSr4xBxZsar1baoWJKNVcFmhw5w17
         HY1OrzpUPKZ3PaQhsz3ShmK6+uRu6qh+nh3AiD0KWTAsqj3oAqSG5kKU8wrwyywr7wQk
         cQbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=X4NcCxXF7k9Z1Trr19zd7vM5+qsrHkvjZK9Hyee90S0=;
        b=EnG3+a5zQB7+fzmjRvwayjHza3ZrG9Gmf2bzqXyWVqIApJd+33KDij/SSsxtFD2u4L
         a9i6N4uWej2wVpbSJhy2/Kaf7QxzLPia3MzfE44JTDTaVNB2MW9JyijqKzpzGtvd0y7b
         47/b0W5fNGLWqD8jSjzg7ZwaB14kqvjZxaQO4MCa9bTQWRmspR0Qyi3pB5Ef0sLP0hqT
         JBQiAqQYIKcbqqi/ZWBjIlLr6GpPA4j08rRJNCNr3rfbsK0ib8kEY8ibs+cDDoJd928w
         xRjVvKWTOx2JYwdWFiR14EPgxy4xpOri+S3ryJ9gtRZE7i2fsclyogKySN3j+OUiCLBf
         bvgw==
X-Gm-Message-State: ACgBeo3jHAH4mO9KIiIG+Xl8TcwdVnqmQ4x/B4JwL849g3tVHv+i9935
	ClDi8RIGL1HOghBK9VpenFI/GnP5MJYJ4dfcVrA=
X-Google-Smtp-Source: AA6agR4JICc7E0FUZLQlYaaaP83CEbr+9RS26LtnWz7NEbVMYwAZgHXPoAkEaBJKHRlDHRl96o5USc4gMok3Uv8IoxY=
X-Received: by 2002:a05:620a:2987:b0:6ba:dc04:11ae with SMTP id
 r7-20020a05620a298700b006badc0411aemr22062478qkp.748.1662100322854; Thu, 01
 Sep 2022 23:32:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk> <E1oTkeb-003t9e-Iy@rmk-PC.armlinux.org.uk>
 <CAHp75VcG5E+yTH2hG2CbnArsm+ZJ-sWRMmM-wLks0xUJkwSgcg@mail.gmail.com> <FEE9F7AE-B324-4426-AB26-17BDF30CFC91@cutebit.org>
In-Reply-To: <FEE9F7AE-B324-4426-AB26-17BDF30CFC91@cutebit.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 2 Sep 2022 09:31:26 +0300
Message-ID: <CAHp75Vd8-mOuJvr=PRKjVKbz0SM9hPe39rEcraOMJFYtrwHjng@mail.gmail.com>
Subject: Re: [PATCH 5/6] gpio: Add new gpio-macsmc driver for Apple Macs
To: povik@cutebit.org
Cc: Russell King <rmk+kernel@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, 
	Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Hector Martin <marcan@marcan.st>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Sven Peter <sven@svenpeter.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 2, 2022 at 12:52 AM Martin Povi=C5=A1er <povik@cutebit.org> wro=
te:
> > On 1. 9. 2022, at 20:55, Andy Shevchenko <andy.shevchenko@gmail.com> wr=
ote:
> > On Thu, Sep 1, 2022 at 5:17 PM Russell King <rmk+kernel@armlinux.org.uk=
> wrote:
>
> >> + ret =3D apple_smc_write_u32(smcgp->smc, key, CMD_OUTPUT | value);
> >> + if (ret < 0)
> >> + dev_err(smcgp->dev, "GPIO set failed %p4ch =3D 0x%x\n", &key, value)=
;
> >
> > Strange specifier... It seems like a hashed pointer with added (or
> > skipped? I don't remember) '4ch'. Perhaps you meant one of '%pE',
> > '%p4cc'?
> > Ditto for other cases.
>
> As was pointed out by Sven elsewhere in the thread, this is an
> unupstreamed specifier (that was missed as a dependency of this
> code).
>
> https://github.com/AsahiLinux/linux/blob/f8c0d18173a7b649999ee27515393f7a=
ae40310c/Documentation/core-api/printk-formats.rst#generic-fourcc-code

I don't see why we need that. The %.4s (0x%08x) is repeating that with
the existing codebase. (I do understand why v4l2/drm have it). Ideally
the first should use %4pE, but it might not be suitable in some cases.

--=20
With Best Regards,
Andy Shevchenko
