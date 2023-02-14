Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269317C
	for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 09:04:36 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id c2so16746988qtw.5
        for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 01:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vi73fGmWmjTNDASDZdnfJSIYN1ahtOW91dirgxR/MuM=;
        b=WrLk7G8ph4exG2WAnUJJd502XIFYTAHK7kRqeS6TTzAVT9cfD4U0gfdU8FLsbcuaA3
         Iiihd2FqvDAuV0LdFQ4mEo2kZsgHudz4E/JhhI+QILjYhwJolPIGnqdfwRXXvERLpgNi
         1ZfaXs/fwsxm4KReDYRnzLbgcIh7GsOkB2eX7UHseZaubN6dm4xn0IC0tL9fisRk35Se
         TpDrW+6vhutfA7JSSxs9CVS+rcynwS34RlyFp4/XdxPzLhHTC7wjoYaWt6BbXaaIXaLv
         jAAow5jaylKC8E6GaVNsFv+70R1n/HK7UJSb7LSQLYU14vTpm0VY4WPmBh/7YsG3D+nK
         aG9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vi73fGmWmjTNDASDZdnfJSIYN1ahtOW91dirgxR/MuM=;
        b=yCttfBDzQ7P7N38KfONriZOR+K925vkwjcWW6K2JiCOkPbD646ng0xYQoPrqAyPPr4
         0tbqjw2tdIVuxV8ok0H5tnCMDnEjHnQniIsTxsnYa+Z4XkeCRfSk0E8wT1Z4bFVU+489
         hJF3A/gcLTfKApKZMjMiXqgGk0z7WjQRuCy7NiWnFSFedPqXZAam4/LNTRrNl7H849zy
         K5X64EkTrm2hoBHiPyvWZZhAz2TT2qhD/9/d3wlBALKx6Az9px0pRo/TgrbIdKVU/5dB
         ipoQh4pTQeOajweH914mnz7Kg8+O6xwCH5idR4mdmZwHy7TD03Tc9PtlEMBKeQ0mLxJw
         itvg==
X-Gm-Message-State: AO0yUKVium8fM6JFQOg/KXFnHBiro2svUAfc/LY2CWfxFi2G70TlcIkH
	kQ739VBpQ6yLjtfLqqTubyypse7i6WRMWo43uc8=
X-Google-Smtp-Source: AK7set/BhpTV/KRldVCK+qjZOJbG2cPSpTKVxLlvt7BPL8FEbisiGeB0cyIcDqr2AdNCos9yQyawt9wXz9U+Dy7tdeY=
X-Received: by 2002:a05:622a:289:b0:3b8:6b33:d92b with SMTP id
 z9-20020a05622a028900b003b86b33d92bmr169724qtw.325.1676365475057; Tue, 14 Feb
 2023 01:04:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230214080034.3828-1-marcan@marcan.st> <20230214080034.3828-2-marcan@marcan.st>
In-Reply-To: <20230214080034.3828-2-marcan@marcan.st>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Tue, 14 Feb 2023 20:04:22 +1100
Message-ID: <CAGRGNgWrRvJezq7svHF7iVohxTdkutEkvLHC=QYUVpic5k=DFA@mail.gmail.com>
Subject: Re: [PATCH 1/2] brcmfmac: acpi: Add support for fetching Apple ACPI properties
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

On Tue, Feb 14, 2023 at 7:04 PM Hector Martin <marcan@marcan.st> wrote:
>
> On DT platforms, the module-instance and antenna-sku-info properties
> are passed in the DT. On ACPI platforms, module-instance is passed via
> the analogous Apple device property mechanism, while the antenna SKU
> info is instead obtained via an ACPI method that grabs it from
> non-volatile storage.
>
> Add support for this, to allow proper firmware selection on Apple
> platforms.
>
> Signed-off-by: Hector Martin <marcan@marcan.st>

Makes sense to me.

Reviewed-by: Julian Calaby <julian.calaby@gmail.com>

> ---
>  .../broadcom/brcm80211/brcmfmac/Makefile      |  2 +
>  .../broadcom/brcm80211/brcmfmac/acpi.c        | 51 +++++++++++++++++++
>  .../broadcom/brcm80211/brcmfmac/common.c      |  1 +
>  .../broadcom/brcm80211/brcmfmac/common.h      |  9 ++++
>  4 files changed, 63 insertions(+)
>  create mode 100644 drivers/net/wireless/broadcom/brcm80211/brcmfmac/acpi.c

Thanks,

-- 
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/
