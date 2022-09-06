Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C553D88
	for <asahi@lists.linux.dev>; Tue,  6 Sep 2022 11:22:16 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id nc14so22423558ejc.4
        for <asahi@lists.linux.dev>; Tue, 06 Sep 2022 04:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=GxQwxvduDPxgkHYfa7obgx4RJSzWpdb3Q2J+POnbbzU=;
        b=wlufJTOluaxqsHty22wfvgr/yaOUMasEMj3CQptHjqMXuIL0VgsnYnf9UJUnPrBh8L
         BMGaxzUHUiAceo2egADuZD1PxZqJlfMgLrugsjt+1c5uPklueqXMvs6y5mmG83w/3Hcc
         NiB2MVxdJMAm3eQTrDrsCbZKiOUbPaCWxYDGh2DjSvHjyyCKIOHsz9AHVNIMliuOTTgu
         3Kta0L0kjSYtIozp36z67zyWKhuWkp7FTKJGxrKrpd3P71zA3qt30uC8CkwrunPvrOYu
         iyKEfzARp1y6GPfMijVrxt9WkHVhnRpdZOoLbG+y5pl4rLrKlINV2FsFO/kiOK6SsSiI
         MZ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=GxQwxvduDPxgkHYfa7obgx4RJSzWpdb3Q2J+POnbbzU=;
        b=P6vP0Se4jeDHwciifqFr5BnUGVO6Kho+guBSlLCpeeB3UpUsTZDIQGqqkoeCMDJ5Gg
         552iT9ulClgShXIl86Gri9geyxgo/wIUJezbl5GdvyY38utznnDFrMR3YodmpO3cG6Sw
         1SbSTLtqubGDSLhjWceO05bQvIfKVJDQ2zRpZBbc96Z91B96mckRyFbnho2GrfKWjHM2
         3Bf4T0LDnN7LQKwcYIHQAEkIQyLY5ygWHhqWnFWbts2Ay1/bmhT4WLY7gy2Pb35rW0DA
         t2BT9LcmklTZBMNeYSUEFR8uGhCAuxXr6zBhSoQL4ZOZPe3otYkdVVcrxuKT7wgYk3Eo
         V5Kw==
X-Gm-Message-State: ACgBeo0s+w5jVzor7XStoEMC801MmajXupTzaSn8lWSFKSp1z0av4bdG
	a+SKEgv0AMw1cRuh+RzDhYRDuHYQjVQpt3pISr1AAQ==
X-Google-Smtp-Source: AA6agR6qOgXW0cQGHTsQD5997iYQ/IwGPFitZiCal+0u+c3seIrnzzlcqbWaneV9j1rFlp2n++AKBdQWpAAmtBm/VIw=
X-Received: by 2002:a17:907:1c89:b0:741:4453:75be with SMTP id
 nb9-20020a1709071c8900b00741445375bemr33365628ejc.208.1662463334764; Tue, 06
 Sep 2022 04:22:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YxDL+cAx9kkZRL8K@shell.armlinux.org.uk> <928ddeff-efac-920c-7bbf-dda35a942b93@linaro.org>
 <YxDOpCq0vIlt4VNa@shell.armlinux.org.uk> <2fedff34-6a20-f1ce-a756-2bd8671fcd52@linaro.org>
 <YxDWG5dmzErhKIXw@shell.armlinux.org.uk> <ef6c7248-1efa-5366-6bcd-900c5f10ccb2@linaro.org>
 <YxDiBFIn6artUOZm@shell.armlinux.org.uk> <CAL_Jsq+GCKisAVA0AfE=yWJYy18mAGQ7rY1sKGYraXv-berNSg@mail.gmail.com>
 <d3cec3d22e464fa8@bloch.sibelius.xs4all.nl> <20220902172808.GB52527-robh@kernel.org>
 <YxcNLU+KGEolrdfT@shell.armlinux.org.uk> <d3cecee5edd24f67@bloch.sibelius.xs4all.nl>
In-Reply-To: <d3cecee5edd24f67@bloch.sibelius.xs4all.nl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 6 Sep 2022 13:22:03 +0200
Message-ID: <CACRpkdaSRcczEF8QZ4aO+-HDVS+n-8MXvn6ysnjJfUEabwUJ=w@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add binding for Apple Mac System
 Management Controller
To: Mark Kettenis <mark.kettenis@xs4all.nl>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, robh@kernel.org, krzysztof.kozlowski@linaro.org, 
	arnd@arndb.de, lee@kernel.org, alyssa@rosenzweig.io, asahi@lists.linux.dev, 
	brgl@bgdev.pl, marcan@marcan.st, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, sven@svenpeter.dev, 
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 6, 2022 at 11:31 AM Mark Kettenis <mark.kettenis@xs4all.nl> wrote:

> Another argument for having sub-nodes is that the firmware actually
> exposes *two* GPIO controllers.  For now we only support the "master"
> PMU GPIOs, but there also is a "slave" PMU GPIO controller that uses a
> separate set of SMC "keys".  We currently don't need any of the pins
> on the "slave", so we don't expose it in the DT yet.

That sounds backward, like we don't expose device X as DT node
because $OS doesn't use it yet. DT should just expose (by nodes or
other ways) all hardware that exist or at least all hardware we know
about no matter what $OS is using.

FWIW I think nodes makes most sense because no doubt for example
the RTC is a separate hardware unit somewhere, and so is the
GPIO. The fact that it is hidden behind a software abstraction doesn't
change the fact that the HW definitely has these discrete units.

Yours,
Linus Walleij
