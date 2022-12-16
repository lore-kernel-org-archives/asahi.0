Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42279371
	for <asahi@lists.linux.dev>; Fri, 16 Dec 2022 04:55:10 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id 4so1215315plj.3
        for <asahi@lists.linux.dev>; Thu, 15 Dec 2022 20:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W0Tj2k/1t7IFFkY/9dHnLGaWG8Wc/rSGoUwoxjZjG0c=;
        b=w/aIbkNZ8GVpY67t83q0gZDEpwPlUa/DEFNFj1k4B142i9zxQXDk7NCxvdpQIAknQm
         BWjMTJf+Solsk8eeHIzQmf5UfsCuHC+K2SWHeEONhtYNf4a0GlFP0/ZGOG4ias6KUzxg
         CKgDHBLcpbUCtMkP42h8ifGqe9rHkgXgKlQhWNXpJXgJfxqhZTACM8TqUf0Cxw51zdMe
         fiq3nwuRFylCxcAMfq/1QIIxl+Akd+jOjVsf552hgkgRcOqvxJXuqdqD0SocmFyg5YHw
         B2zEMQ6zrCkrimzljP2BQS6+wq/xNLrgS/oGLlS1zdsuuVG0QaeSx2Af2HoQAU21ThOB
         fb9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W0Tj2k/1t7IFFkY/9dHnLGaWG8Wc/rSGoUwoxjZjG0c=;
        b=q+sp3CTstpq1RpzkeHwvbdsOJO5Y+OrD55yhsKNpQJaO+FZuyjKTUBzFlVdOkRRatX
         YbzTFbmu5QCnKcZTVoMWuZ4Q1as4KQW9a1i89/iu4D0Ytq0XoYXWPEzUvRAF1qP2nLdn
         t8OSkiCs8uWr18BOgl326zNq4h69aTN3LcO0ZAkG0jf+VKK44LaxC1jlFERC0ngsbDw4
         +7lX+V7Oh9kU/tgo8mQRyGqBkoWMiupdHPGnhZ3AMtjgX2PrE4/KcdJOVmJkcNr55sCv
         go5B7e1f24+WzYXjsTh5irT1ZjNpE6OOS5KZcgbmYvU4YHod0toauq3tMO7J3cs0Teuf
         YXaA==
X-Gm-Message-State: ANoB5pljLXUHSBDxkcmit3pnEqaVHsnDFwnoSBgUeyHTkLy5frc0tdJI
	TBLWgNFEH80oF8t9qfc3wxEzfw==
X-Google-Smtp-Source: AA0mqf57oecpu1XU54PlDJZcjwZdwR4smxE5Zu9aOaFo5PtlUFwVlK19poM3sY1qyj6L5LO2/x79KQ==
X-Received: by 2002:a17:902:7143:b0:189:5ff6:903a with SMTP id u3-20020a170902714300b001895ff6903amr30167034plm.52.1671166509616;
        Thu, 15 Dec 2022 20:55:09 -0800 (PST)
Received: from localhost ([122.172.87.149])
        by smtp.gmail.com with ESMTPSA id g6-20020a170902c38600b0017f64ab80e5sm509175plg.179.2022.12.15.20.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 20:55:08 -0800 (PST)
Date: Fri, 16 Dec 2022 10:25:06 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Eric Curtin <ecurtin@redhat.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Marc Zyngier <maz@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: apple: remove duplicate intializer
Message-ID: <20221216045506.edsjlxkkhma4mh5h@vireshk-i7>
References: <20221215165523.1920672-1-arnd@kernel.org>
 <CAOgh=Fw4BXvGNV0bsTXfSxy+ks09ed=nbJhkOWE+UrT7LW+r6A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOgh=Fw4BXvGNV0bsTXfSxy+ks09ed=nbJhkOWE+UrT7LW+r6A@mail.gmail.com>

On 15-12-22, 17:10, Eric Curtin wrote:
> On Thu, 15 Dec 2022 at 17:05, Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > When -Woverride-init is enabled, gcc notices that the .attr
> > field is initialized twice:
> >
> > drivers/cpufreq/apple-soc-cpufreq.c:331:27: error: initialized field overwritten [-Werror=override-init]
> >   331 |         .attr           = apple_soc_cpufreq_hw_attr,
> >       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~
> >
> > Remove the first one, since this is not actually used.
> >
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> Reviewed-by: Eric Curtin <ecurtin@redhat.com>

Applied. Thanks.

-- 
viresh
