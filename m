Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF50C7C
	for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 09:00:59 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id v17so16756113qto.3
        for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 01:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Sotg6g4Bh/A8PVyKxmYXGABNEX1eJU5WjsjoyOoCPXM=;
        b=nYm5hMXfNfniL4C7SsUcbr0NG/2bqbQphI2J2mYuEDYsJq7PkY6lIc24t8x9TrBMoM
         LYiRT7O85Vz+1ZbDcjXZw2EuxdLL+gpmCsyx2zYv38z5eYbem9lv/0w4kLHPeE0//PhW
         78iY2AfZL7gtOqxAkjhuuqru9vTNOheliaThYT4VSp0Tabx2xLUJmVYHgwkrToArEzbT
         flACIUXw8tjKFCO6euF0cXAyLNlgwwjSvVPb0JRHBghZt8mtW1E21GrjkBPHRvbLGWpy
         JR9Q1eJWO0ocFOEqqJ3OrFhH38yn8B2f/+UZIkxJ3IR7L8hi7GEUMeswRujc9BqX9xQg
         EilQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sotg6g4Bh/A8PVyKxmYXGABNEX1eJU5WjsjoyOoCPXM=;
        b=rEV7bb9iVZ29b5sQyQZI9PA5r+jmBiHVjyrHyKjJfh7xnf/CGRDg83f1O3cBIHpnxH
         wp04Wn5OEqasXUwLI2s0c9Z+QWEY6nDRf09Kksme9+jzhDhUXYsC50/lxojCRm9p8dsb
         5LQ+obTCtvLU/U1HntJRq/sACHhUWUKex+uFWN/saHs0cCX1EfNN2KZ/m0TooDGlc7uJ
         t+AfufdcH1AMBuyGOrlvcMoZQsGY4vtg55WXWA84cGWwye4k2VovKPucLLfiaJVp2bsO
         Fp74Daq639uQkN499M4zhPcxOULi2xQSfEq6jUi37xd7q4Y54o6+M1iThOtfXl0dpVhc
         GdfQ==
X-Gm-Message-State: AO0yUKUibkZUjs6E96YRceY+iIWjCMeHUBZMBfSKoKdnSt/v6z11KE82
	04aiWqyllvGTsFWqMpDuE05H1sr6Go+r8MhdNCc=
X-Google-Smtp-Source: AK7set8BrQ3EZL7oYNrSDTXecmNQ+MEqyA40JVLuuUbf8otkPYKFo01zkl8m26ZDac6afBBX0vqQBt2ouoflSVuLxmg=
X-Received: by 2002:ac8:5c0d:0:b0:3b8:6b25:88be with SMTP id
 i13-20020ac85c0d000000b003b86b2588bemr232093qti.14.1676365258564; Tue, 14 Feb
 2023 01:00:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230214080034.3828-1-marcan@marcan.st> <20230214080034.3828-3-marcan@marcan.st>
In-Reply-To: <20230214080034.3828-3-marcan@marcan.st>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Tue, 14 Feb 2023 20:00:45 +1100
Message-ID: <CAGRGNgV6YMhBa1bdkf_EQ0Z+nwbfhJkKcTxtc=ukWVMWtvQ2PA@mail.gmail.com>
Subject: Re: [PATCH 2/2] brcmfmac: pcie: Provide a buffer of random bytes to
 the device
To: Arend van Spriel <aspriel@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Franky Lin <franky.lin@broadcom.com>, 
	Hante Meuleman <hante.meuleman@broadcom.com>, Kalle Valo <kvalo@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Linus Walleij <linus.walleij@linaro.org>, asahi@lists.linux.dev, 
	linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com, 
	SHA-cyfmac-dev-list@infineon.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Arend,

On Tue, Feb 14, 2023 at 7:04 PM Hector Martin <marcan@marcan.st> wrote:
>
> Newer Apple firmwares on chipsets without a hardware RNG require the
> host to provide a buffer of 256 random bytes to the device on
> initialization. This buffer is present immediately before NVRAM,
> suffixed by a footer containing a magic number and the buffer length.
>
> This won't affect chips/firmwares that do not use this feature, so do it
> unconditionally for all Apple platforms (those with an Apple OTP).

Following on from the conversation a year ago, is there a way to
detect chipsets that need these random bytes? While I'm sure Apple is
doing their own special thing for special Apple reasons, it seems
relatively sensible to omit a RNG on lower-cost chipsets, so would
other chipsets need it?

> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Hector Martin <marcan@marcan.st>

Beyond that, it all seems pretty sensible.

Reviewed-by: Julian Calaby <julian.calaby@gmail.com>

> ---
>  .../broadcom/brcm80211/brcmfmac/pcie.c        | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)

Thanks,

-- 
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/
