Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248CE79CD
	for <asahi@lists.linux.dev>; Tue, 31 Jan 2023 14:18:07 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id u5so9969522pfm.10
        for <asahi@lists.linux.dev>; Tue, 31 Jan 2023 06:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D/tLUdHiIHb80iO9Lp6bZpLrU9d/zmMciFOjvZujeYU=;
        b=M7BEAZl9XM9H/0i/cZkTiFAj6gsYn05hTXFFLpAf4k7OyA1bg+txR7mkki7YAcPPW3
         oLmFuZ8vC9EolA/0BQLZdhhC94OeHSQMECFcMpY/CykmgCZHc77HHG/seByXRbR904mF
         jIHlzSztlVJRjbrOCMVKJzX4AJvT9NjY5O6+s37lCDOrHfXhfj9qPmyONeuL/Ua502te
         2GsOE5fZuSDI2Qkf8AauNi7QR3TfbgPVEJz2wfsQLq3Pmn5UbX9JD9JRvBYHdcm8YAuA
         4aqMNWgRTmojcWqkyThZtuuVwpGeCV/iUhYjVd4jOOjLarkILE8jbk54NrTZXHAxqbTY
         HFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D/tLUdHiIHb80iO9Lp6bZpLrU9d/zmMciFOjvZujeYU=;
        b=V8ra3st+Lv89e4IAuIJFSlYxxYMHkC44yZWGN/CF6mf8hJKE6w6F+GmV5AdiQfTjV9
         eygaKAdxywu4ogMu9TjMQEMeQpSgHHf1aygC+rCAF77FuJgHfac0K10Ad4QpUN36W+YE
         wdopVlAi5bgVVplkiEmc0QLYi7H2RQT4n64sGfqUFIxCO6C2I0z0YLZ3hk/QhHgi0CzS
         mYgQVPVbck0F+S3WjUIQBuZEQLbo71SXIhzs5slMKLnSPGOoXNawzSersJRWR4acmh8i
         han5pa9aygNGmUAxXgK4UpsDe2LlVplAJ94mJeE0Wz+D8/ZHYdkq2YvqQLDyp/QMuMq3
         lWwQ==
X-Gm-Message-State: AFqh2ko+g6FNAEpGPjNhYUUIMdVrLlJjbyn5bvarJ9n8VFkhvPNmMsR9
	NZslBj8VeEx8etQwybESzD9PsOnXKLtmoZVXNOo=
X-Google-Smtp-Source: AMrXdXs9/A8sqP6U1AUBHsMTAuuw85NEz8wAEfIlns2ZHq3egt0ctehCpLkguo4QE4wz3Iwieal9NkYzu6ISoyDaFl0=
X-Received: by 2002:a62:1989:0:b0:58d:ae61:c14b with SMTP id
 131-20020a621989000000b0058dae61c14bmr6651888pfz.51.1675174686518; Tue, 31
 Jan 2023 06:18:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230131112840.14017-1-marcan@marcan.st> <20230131112840.14017-2-marcan@marcan.st>
In-Reply-To: <20230131112840.14017-2-marcan@marcan.st>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Tue, 31 Jan 2023 15:17:55 +0100
Message-ID: <CAOiHx=mYxFx0kr5s=4X_qywZBpPqCbrNjLnTXfigPOnqZSxjag@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] brcmfmac: Drop all the RAW device IDs
To: Hector Martin <marcan@marcan.st>
Cc: Arend van Spriel <aspriel@gmail.com>, Franky Lin <franky.lin@broadcom.com>, 
	Hante Meuleman <hante.meuleman@broadcom.com>, Kalle Valo <kvalo@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Alexander Prutskov <alep@cypress.com>, Chi-Hsien Lin <chi-hsien.lin@cypress.com>, 
	Wright Feng <wright.feng@cypress.com>, Ian Lin <ian.lin@infineon.com>, 
	Soontak Lee <soontak.lee@cypress.com>, Joseph chuang <jiac@cypress.com>, 
	Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Aditya Garg <gargaditya08@live.com>, asahi@lists.linux.dev, 
	linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com, 
	SHA-cyfmac-dev-list@infineon.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Hauke Mehrtens <hauke@hauke-m.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 31 Jan 2023 at 12:36, Hector Martin <marcan@marcan.st> wrote:
>
> These device IDs are only supposed to be visible internally, in devices
> without a proper OTP. They should never be seen in devices in the wild,
> so drop them to avoid confusion.

I think these can still show up in embedded platforms where the
OTP/SPROM is provided on-flash.

E.g. https://forum.archive.openwrt.org/viewtopic.php?id=3D55367&p=3D4
shows this bootlog on an BCM4709A0 router with two BCM43602 wifis:

[    3.237132] pci 0000:01:00.0: [14e4:aa52] type 00 class 0x028000
[    3.237174] pci 0000:01:00.0: reg 0x10: [mem 0x00000000-0x00007fff 64bit=
]
[    3.237199] pci 0000:01:00.0: reg 0x18: [mem 0x00000000-0x003fffff 64bit=
]
[    3.237302] pci 0000:01:00.0: supports D1 D2
...
[    3.782384] pci 0001:03:00.0: [14e4:aa52] type 00 class 0x028000
[    3.782440] pci 0001:03:00.0: reg 0x10: [mem 0x00000000-0x00007fff 64bit=
]
[    3.782474] pci 0001:03:00.0: reg 0x18: [mem 0x00000000-0x003fffff 64bit=
]
[    3.782649] pci 0001:03:00.0: supports D1 D2

0xaa52 =3D=3D 43602 (BRCM_PCIE_43602_RAW_DEVICE_ID)

Rafa=C5=82 can probably provide more info there.

Regards
Jonas
