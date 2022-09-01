Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857216AD6
	for <asahi@lists.linux.dev>; Thu,  1 Sep 2022 17:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662053146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Yhiq+uzZquevHh6W5PlwgpPs6hTPERlicGPTwhiJ5Ig=;
	b=V8TMDfQQ0Srto/vOD8KZ8ZCiv5BxU0U5zon7AkA3rJB3vOPk5oEY2mqHYqBo8mUJMLGrZg
	o9n5x1qT8pK7kyM+yWD4UjS46r++iVSsaa8Sc1XUrKQpPE7Vm583zu/xYGGxX9tyqNqC5D
	fTlAoZ3R0uoe2dye8BSHmTWq80SaZA4=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-551-Fl2Ffo22OG6eG5ZUCsUYTg-1; Thu, 01 Sep 2022 13:25:43 -0400
X-MC-Unique: Fl2Ffo22OG6eG5ZUCsUYTg-1
Received: by mail-qt1-f198.google.com with SMTP id k9-20020ac80749000000b0034302b53c6cso14317381qth.22
        for <asahi@lists.linux.dev>; Thu, 01 Sep 2022 10:25:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Yhiq+uzZquevHh6W5PlwgpPs6hTPERlicGPTwhiJ5Ig=;
        b=FkBhpPjyTfcOHHtJRSILdnFo6BHkYbC6gqT8mZB2H+ZMalKNPV5hoyQ2isv7w6M81V
         b6QScU9NW7YgNWHZ0jb+WfnOKhY8E+or33JsjfTaU4AHkCMBd6D/9gnyJZ4otlS9nRHa
         Krv4xs4G66DJdaVw4k+6mJ8SfKioEjCA8ZYQrsAHUcf+2JC78cn7hj3XQcqh9TQJzGyd
         +P6hXQWmwJ2VvJkiAZA9rPq6eZ9EuxL9N2//o32IB5yBkz7DJvXFVxlINVEvzAv6sgEU
         AmN2RAdYxZ46bek6zFJoWsoHmfK2Rmhoa1ELRrc6ZLwRW1YG8vw1O7kkzWCVlBCjgdmY
         HmFQ==
X-Gm-Message-State: ACgBeo11Jxp3gTNEoHpjgIc92xMKuhXk20fivoKcIlSYGJA/YwmNI4yS
	4hfGmRLF+Rc3HHdkq+w0jMN6+qPnP6jvLpSM+/5JFbmO45nzQh3oQwq2uqOHILyRn/vTHPXb/dQ
	pGW+SnMJBdHfKzhdPgeQ8pvocxhvTvEc=
X-Received: by 2002:a05:620a:f10:b0:6aa:318e:55a9 with SMTP id v16-20020a05620a0f1000b006aa318e55a9mr20109055qkl.559.1662053142855;
        Thu, 01 Sep 2022 10:25:42 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6H+iDi5O5k3M6nEBNZA3HLo0Yzmi5upyVTsAbeN+D1ILZKxFbooCpeZvW9sBJEBmKPiow4VeJ91+tCW5nNdOs=
X-Received: by 2002:a05:620a:f10:b0:6aa:318e:55a9 with SMTP id
 v16-20020a05620a0f1000b006aa318e55a9mr20109041qkl.559.1662053142668; Thu, 01
 Sep 2022 10:25:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk> <E1oTkeR-003t9R-BK@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1oTkeR-003t9R-BK@rmk-PC.armlinux.org.uk>
From: Eric Curtin <ecurtin@redhat.com>
Date: Thu, 1 Sep 2022 18:25:26 +0100
Message-ID: <CAOgh=FzvV5cLOW-27JqPLr-Y6VryyEXcqOOF+ARYx+vWEoafcw@mail.gmail.com>
Subject: Re: [PATCH 3/6] soc: apple: rtkit: Add apple_rtkit_poll
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Hector Martin <marcan@marcan.st>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, Sven Peter <sven@svenpeter.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 Sept 2022 at 15:03, Russell King <rmk+kernel@armlinux.org.uk> wrote:
>
> From: Hector Martin <marcan@marcan.st>
>
> This allows a client to receive messages in atomic context, by polling.
>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Eric Curtin <ecurtin@redhat.com>

