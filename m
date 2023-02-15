Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4ED7B
	for <asahi@lists.linux.dev>; Wed, 15 Feb 2023 16:47:20 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id fi26so23159291edb.7
        for <asahi@lists.linux.dev>; Wed, 15 Feb 2023 08:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gWUISe+0HJ9YU1Zk8I5ieMOKSVMFYOw4cw3Zj6d7n2s=;
        b=C3Mgb3sIx6xX2jPwuKfRtQaIior7RYVYX08b7O46Ieeh37jS2SeyTCt7yGnGUxmXmS
         hZnGh/uPnB40FGL4d/VnpaAmkHDW6KYgQXomkpbO1uHUsXwsh1nYJoOLWiYUSkxGGrCt
         NofgdYJf+nMTLRjTx71WQ+r/bPcupTY/2/CX5TZ46CihnGT6Rnusj4U48vXuujcwAKXL
         wCLmJcOuHn3IeSEuvMeQc4psEGNlBHiVhYw1R2UaGtD9k6s7Z4T11PLMkaY/FiGJmB4C
         Pr8Hljw+phfFgIu0pH1GwKZo4k3IQe6Tli/omSPqTjpbP9engMOGahhJcdjQxvaeoBe4
         44HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gWUISe+0HJ9YU1Zk8I5ieMOKSVMFYOw4cw3Zj6d7n2s=;
        b=hYvI7t/CohJmMQ9eG8fVum7ocdUpDMXvYYcAa005/RppSNVR8lsgp/HXGlFLduw3xW
         oquhNSbAuUWOBqSCASyK1WO/0WflpzTv+8a/aIH+3Blso44c/xR9dBhPnDbMNcAiNMlW
         wq83oPmH2UcjNf36t5J1JzA3wopy4UVHAPj8qiVJ8EAKpDNQiGiLfeDKVums9KdIGs+/
         QyVPNtjGmn5Yj1UCqDC46RTrvgRt5pxXjtvw9vhlA/uoBzcbvogxAbVSB6mo7mQp2eOO
         cmIGeKFclVY/MTIIsUcx1O4sq3u36m4HK5CGX8w7Qu4VS1XAXfD3mP+hv/c8a1XinSEj
         EYuw==
X-Gm-Message-State: AO0yUKXLVee2x7eq9Tm3jbzmXY90D2o9srLV6PEuvNJFgByiXQSMYlBb
	sZMI9Wl6qZQ1xY2KnywIAis//OhNACc4Dw76xno=
X-Google-Smtp-Source: AK7set86MN3jsbNFlFmIEMts91fMfvzW7bAkwAoBMxjT7ynQy+L/J2YSrZeR8z0+U8QTQmAF0s6EnZNWKpsjxtLhpQE=
X-Received: by 2002:a50:bb4c:0:b0:4ac:b5d8:6b2d with SMTP id
 y70-20020a50bb4c000000b004acb5d86b2dmr1535972ede.4.1676479638430; Wed, 15 Feb
 2023 08:47:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230114132508.96600-1-fnkl.kernel@gmail.com> <20230114132508.96600-4-fnkl.kernel@gmail.com>
 <20230215111652.lyhebfntqlibtmex@pengutronix.de>
In-Reply-To: <20230215111652.lyhebfntqlibtmex@pengutronix.de>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 15 Feb 2023 17:47:07 +0100
Message-ID: <CAMT+MTRydNiYnhBJYVCoS5iXnhr7MywCV0t7FanHWwbwv2TrbQ@mail.gmail.com>
Subject: Re: [PATCH v7 3/5] arm64: dts: apple: t8103: Add PWM controller
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: thierry.reding@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, marcan@marcan.st, sven@svenpeter.dev, 
	alyssa@rosenzweig.io, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 15 Feb 2023 at 12:16, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> This missing newline looks wrong.
>
> Otherwise the patch looks fine to me.
>
Do you want a respin, or can this be fixed when applying the patch?
