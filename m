Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAEB4A24
	for <asahi@lists.linux.dev>; Tue,  6 Sep 2022 13:38:21 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id fg1so1214170ejc.2
        for <asahi@lists.linux.dev>; Tue, 06 Sep 2022 06:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=8j3iu7+QNQJ23oh0RvmPe+tMoX9hlrqhQYHAMxRoxm4=;
        b=uFWPwn2VJziZW+HA6LrWm6uAZxZ7AAkEK+UCYwcfecyhrX9wQrNd/SDpgXe8m+z3t7
         6UE+A2LZsW+SBWLdVl2r+y1ZFFXIVLFNFRKNgEQ0JLL2NxAp7a30aAGR8OMnqyLAm4qH
         W3eAwkNqm8F0ORnU4nr7hDmsofLT3FJhb/PnrJpUi1uK+6ChvLyvUJXrFADB6z+Q/aNp
         DgpMcpeLzPiNU9nAngfPmEeB/PAtgeMRB1woWEuVEoiLZ9IfKNmGyMfOvBnOrBqkMWQm
         LnwF3ih3RiCFHEe2WFA909cUQrao9AUGlFUucUpF9nYSgXetwgU2g7g6LRAU2CfoGAzC
         tZVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=8j3iu7+QNQJ23oh0RvmPe+tMoX9hlrqhQYHAMxRoxm4=;
        b=JJnMMWSJJht2kJVGzmum+BmyuxwqJ13E7Xj/nOm7VniQIWjVi2MtXr0GFulzzN40Xn
         FWtnDw6AWKzojmOJnS5pkuCQ9QDg3Z6cSGWnzUwBf+cWFdl5RvXyrZYBG50jJUW+g8D2
         xo9mYqwynZ2UbjfcjT1lRAyC25KLVDfoobk6aGYsq4NH46p5cuZo0GecjKOv9SC1Oz/Q
         tV/q12TNjdQ5YC8aRJI0OaBqUfrSQ7RHQ15anT6FcI7kk3HC0em1P2HiNBdJhiuZ5W8G
         3Rh/EmhBznnwBTF+hhv/gD76XfhWvUE/4n3JY8DD5WJg+Tn99Xhm0y7TlVohAJxhr1xk
         BEmg==
X-Gm-Message-State: ACgBeo0l43KXwacS7kxP0kPVCNe3MyrnKzPGKlYn7Wbb0hl0eDqyuLeG
	BzBSwLsa2uj1VpDTLP17Hw8WfMkSgFJsjjrOvTA/Fg==
X-Google-Smtp-Source: AA6agR5bt19KIJibKb5OfdrwikN7TmkyTEX14efObQx8H0Svbutp2QjRsBLKvv9UqMC3h2dRJxI/ygCQvsNdpS4WJA4=
X-Received: by 2002:a17:906:9b86:b0:73d:72cf:72af with SMTP id
 dd6-20020a1709069b8600b0073d72cf72afmr39902857ejc.440.1662471500115; Tue, 06
 Sep 2022 06:38:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YxdInl2qzQWM+3bs@shell.armlinux.org.uk>
In-Reply-To: <YxdInl2qzQWM+3bs@shell.armlinux.org.uk>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 6 Sep 2022 15:38:08 +0200
Message-ID: <CACRpkdaF9s0Qzxa=dhj0k+xg+F9UEteeUuDuwi9XKwz=cVyuiA@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] Add Apple Mac System Management Controller GPIOs
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev, 
	Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org, 
	Hector Martin <marcan@marcan.st>, Jonathan Corbet <corbet@lwn.net>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Petr Mladek <pmladek@suse.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Rob Herring <robh+dt@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Sven Peter <sven@svenpeter.dev>
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 6, 2022 at 3:18 PM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:

> This series adds support for the Apple Mac GPIO driver. These GPIOs
> are hadled via the System Management Controller.
>
> The first two patches add the DT binding documentation for the new
> drivers. No changes from the first posting (I think there's still
> some discussion going on about how best to handle these.)

The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I'm happy with this, and it will be possible to augment
easily for future needs.

Yours,
Linus Walleij
