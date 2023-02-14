Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CA07C
	for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 09:11:31 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id ch10so15632137qtb.11
        for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 01:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W5HgoftjWnKaZB9WMngfkr+9a/dXo/FJFDXK14dxBTY=;
        b=NHl2Azqc+UQ5FZvagtUU968byxOtD9ULnLCAFP39b1i2dEiKtXKqz8+fdOKvxr0jdm
         kWHa0YNQ4B7tpXdzBi73woit0rKWknM8c/+ke2zcJZqxcGFcx5j5eMzdrc/ZH32CcJZ+
         gTMrq7MOnLG6NzBYpiQMIbcL8cnXJCsmL1MwKnOw+QKpWniEuFATkx8xVbtOxJV8GZ4H
         25JIXxgeIKumCKAR5QjgieJ+i0MILVcxUx4NnvD5UWdJPQb9tgfg+vTEujKOjIHgE6EX
         uvKcaydNXE7X7Tqa/njVPj7lJYj8A6NUmu3LWuDsT3ivMO1OQrKY5/tjFqdZJF9R0GBI
         MYfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W5HgoftjWnKaZB9WMngfkr+9a/dXo/FJFDXK14dxBTY=;
        b=LQBJzui4iVqjgxkC50tVRl6tqwBRIZ2Z4FhuLWmINeBkGy3NaVGRZ7z6CciU2HUF0u
         HAyur31tTrpYJdmGp5YX0SxcEK7eoGk2ch8TpzF3L5ETtpfPxF+jJ12eoe8BPmF2CbvI
         B2JUZQGzxcR4HzTUY0MGAz0f1cNgEYxBzLqZTBTYpgIcjKlzMRaXRVq/vVfPZcXPviQV
         oNcg44VmiyUBk+e8jQB/aLiGvjjiVsjYXZjC+B5k9bU6j4H89MMlA7FT3S7EAxq/cDNk
         a/ST8HA+XJItbRFkMIHqG/XnxI0GHDNT+UkeYTPlsNLpg2C9m/rp0L4y1uqTY3O7vynr
         x18w==
X-Gm-Message-State: AO0yUKXCElhAtTRLVQRlmWZln6zFFtI/KoJ9lg+8yFLUluHR63Mh+vNu
	aOHlcDrw/FxBG06T/PDGcLZYVPsA4fjssd7qtN8=
X-Google-Smtp-Source: AK7set+WS/yIY5Z2eiMuhpOsCXR4iacCVtUdbB4RSkt+9yamWmbLhxFi0NSrOCMHriE9cgu/fmpqsFMr2hfCIdqv2Z0=
X-Received: by 2002:a05:622a:289:b0:3b8:6b33:d92b with SMTP id
 z9-20020a05622a028900b003b86b33d92bmr171615qtw.325.1676365889757; Tue, 14 Feb
 2023 01:11:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230214080034.3828-1-marcan@marcan.st> <20230214080034.3828-3-marcan@marcan.st>
 <CAGRGNgV6YMhBa1bdkf_EQ0Z+nwbfhJkKcTxtc=ukWVMWtvQ2PA@mail.gmail.com> <a9281140-8b9d-41ca-bc2d-3c2d2e78259e@marcan.st>
In-Reply-To: <a9281140-8b9d-41ca-bc2d-3c2d2e78259e@marcan.st>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Tue, 14 Feb 2023 20:11:17 +1100
Message-ID: <CAGRGNgV2EALagFHKhBwDaySEFMufeK=7shF-yTRtJkFuF+W1Gg@mail.gmail.com>
Subject: Re: [PATCH 2/2] brcmfmac: pcie: Provide a buffer of random bytes to
 the device
To: Hector Martin <marcan@marcan.st>
Cc: Arend van Spriel <aspriel@gmail.com>, Franky Lin <franky.lin@broadcom.com>, 
	Hante Meuleman <hante.meuleman@broadcom.com>, Kalle Valo <kvalo@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Linus Walleij <linus.walleij@linaro.org>, asahi@lists.linux.dev, 
	linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com, 
	SHA-cyfmac-dev-list@infineon.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Hector,

On Tue, Feb 14, 2023 at 8:08 PM Hector Martin <marcan@marcan.st> wrote:
>
> On 14/02/2023 18.00, Julian Calaby wrote:
> > Hi Arend,
> >
> > On Tue, Feb 14, 2023 at 7:04 PM Hector Martin <marcan@marcan.st> wrote:
> >>
> >> Newer Apple firmwares on chipsets without a hardware RNG require the
> >> host to provide a buffer of 256 random bytes to the device on
> >> initialization. This buffer is present immediately before NVRAM,
> >> suffixed by a footer containing a magic number and the buffer length.
> >>
> >> This won't affect chips/firmwares that do not use this feature, so do it
> >> unconditionally for all Apple platforms (those with an Apple OTP).
> >
> > Following on from the conversation a year ago, is there a way to
> > detect chipsets that need these random bytes? While I'm sure Apple is
> > doing their own special thing for special Apple reasons, it seems
> > relatively sensible to omit a RNG on lower-cost chipsets, so would
> > other chipsets need it?
>
> I think we could include a list of chips known not to have the RNG (I
> think it's only the ones shipped on T2 machines). The main issue is I
> don't have access to those machines so it's hard for me to test exactly
> which ones need it. IIRC Apple's driver unconditionally provides the
> randomness. I could at least test the newer chips on AS platforms and
> figure out if they need it to exclude them... but then again, all I can
> do is test whether they work without the blob, but they might still want
> it (and simply become less secure without it).
>
> So I guess the answer is "maybe, I don't know, and it's kind of hard to
> know for sure"... the joys of reverse engineering hardware without
> vendor documentation.
>
> If you mean whether other chips with non-apple firmware can use this, I
> have no idea. That's probably something for Arend to answer. My gut
> feeling is Apple added this as part of a hardening mechanism and
> non-Apple firmware does not use it (and Broadcom then probably started
> shipping chips with a hardware RNG and firmware that uses it directly
> across all vendors), in which case the answer is no.

Sorry, I should have been more clear, I wasn't expecting you to know,
I was asking Arend if he knew.

Thanks,

-- 
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/
