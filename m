Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A481AD4A
	for <asahi@lists.linux.dev>; Fri, 13 Jan 2023 18:25:21 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id fy8so54081224ejc.13
        for <asahi@lists.linux.dev>; Fri, 13 Jan 2023 10:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4BkJEBPpFp0pdf+2AA0OV5kVpWpuYa4Hsr4hU8c+OCE=;
        b=SOzKAJLf6d4epJGp9iSEVY1rLx7EVFkFbKY7h/gVewp5IkmEp/0OSNPIYQGVq7QV/4
         s+r4OZ6Z/3XqyK6voJzbW0m+ckU1i+GBuXalixtnPyv6uVFpPDIvkdPsgfRopZz7b21C
         ly+3L+DU/ihrp0ZRj8shyvbM+RlJnB3dRWbVNbym/FA59O15U868GTaYXjt6vM+YZf49
         cimoE93fXnAIb7z4TPFqaHjSBrca1PUar53r/m8PH9T2V+4mw1dBCgSo5AAoU9CkewWX
         xmPM7ev2nOPcL9BbGt5Mk6Wq5Goo2wqBDhqXVQ1c0HFu7cc0khDVvfrnYCntWkif0JGZ
         66Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4BkJEBPpFp0pdf+2AA0OV5kVpWpuYa4Hsr4hU8c+OCE=;
        b=AWG+QLMMWUJAF7r9GiE5IJtuQoAshRAwaolcJfIeStPIc3YYIS7rWJzWmFxq0WDdTW
         RYBoMzyBVgXneeqi84n5Uls6mLf3u8lUkwoBF/DKpSTOAgx6s+cCO93vBGGPb01th7RM
         pLI6b1ePexG/cqYuwUt7uzXGTUbMEDN+RYczxMsqXcH5Zw7QEJhqV4RApOE2Y/oAGE4X
         H3Hp3v8KC3E+hz1xagdFP0QTj/F60/EilELHPLWjo6Z/uZmIeZbl+5g0iaPjb3K6GtPm
         y+H+8YXZ+zd9bUj9mSjXHTQhEVW4CyLzElD00W66cJ+14kLAqPh86KqjwFzmPzxD6oP1
         cPqw==
X-Gm-Message-State: AFqh2kpSUOTCAcqVCq8HdnEAYfuDIliJsTKbTT/Ao0pf+L7gNUI0TSKk
	JGluuf8WME0mLCy+88+4Wn6LRIR/+0Sr2X58Ajc=
X-Google-Smtp-Source: AMrXdXsX3njBYJXQ3IXRoza4QRwgA+qz3BIB5sslyCQZSLsG2ysEexM7uipsJPOW96T/wVpgX5LDy66TmR+XdKUT6BA=
X-Received: by 2002:a17:907:98cb:b0:78c:1f2f:233e with SMTP id
 kd11-20020a17090798cb00b0078c1f2f233emr9837860ejc.307.1673634319796; Fri, 13
 Jan 2023 10:25:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230106135839.18676-1-fnkl.kernel@gmail.com> <20230106135839.18676-3-fnkl.kernel@gmail.com>
 <20230110230618.pfz267jj5ne34ava@pengutronix.de>
In-Reply-To: <20230110230618.pfz267jj5ne34ava@pengutronix.de>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Fri, 13 Jan 2023 21:25:08 +0300
Message-ID: <CAMT+MTToR+0_CmVBuGfLemALUv1XuevObAMB=TQXV0Vd7HdW5Q@mail.gmail.com>
Subject: Re: [PATCH v6 2/5] pwm: Add Apple PWM controller
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: thierry.reding@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, marcan@marcan.st, sven@svenpeter.dev, 
	alyssa@rosenzweig.io, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 11 Jan 2023 at 02:06, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> > + * Limitations:
> > + * - The writes to cycle registers are shadowed until a write to
> > + *   the control register.
> > + * - If both OFF_CYCLES and ON_CYCLES are set to 0, the output
> > + *   is a constant off signal.
>
> How does the PWM behave with *APPLE_PWM_CTRLAPPLE_PWM_CTRL =3D 0?
> (typically: drives constant low)
>
APPLE_PWM_CTRL =3D 0 implies that the APPLE_CTRL_ENABLE bit is set low, whi=
ch
turns off the pwm signal (constant low). I do not think that it is
necessary to explicitly
specify that case in the comments.

> Can you please rename such that the (maybe new) name for APPLE_PWM_CTRL
> is a prefix for the (maybe new) APPLE_CTRL_ENABLE and the other register
> bit definitions?
To make sure, you want the register named APPLE_PWM_CTRL, and the bits name=
d
APPLE_PWM_CTRL_ENABLE, APPLE_PWM_CTRL_MODE and so on?
