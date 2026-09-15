Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CEF47ECDC
	for <asahi@lists.linux.dev>; Tue, 15 Sep 2026 22:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789511789; cv=none; b=cPm3WhL2KxoL03Wwci3+7GGK+qmgbmOxg6u9JuPS07V3eb61rydLmntL1dGyTCiEAjzunj8S4tt19MqQ6r2FFQz13aEkRzEasYz/rgciEmT1qXnz4zTmzEx76SCwz3xWbz5DqbS0gfvnsdM4FJ4waQ9iaZFOAb1x5crRQp7okDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789511789; c=relaxed/simple;
	bh=NKKatqC2Re9eTa1xhiTQLVOdbcOfrB6iOyjGbHs3BmQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fIqpWY1T8lfW1D2nH2vkYJgR02DxDgsCPxWAg/fRHb533a3jBQ+KwAH1McIFoOCULKHGNDdu/8phgwicNeUNWvU0X9HRaZ1OhZxgBkuhmhQ42nS9LClR2WKd1YyLy++5uxmOoPvBfN4a4MWq6YFHwGL/kA/VzDVdeHMbGi6l/vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi2-f12.google.com with SMTP id 5614622812f47-4c5b53d710cso222197b6e.2
        for <asahi@lists.linux.dev>; Tue, 15 Sep 2026 15:36:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789511785; x=1790116585;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yQxcNZFJRBnNKYE5HTxR/5YC6FQVB68aqhBIuL0+JAU=;
        b=wndg9+rCEQFLhN+wmyvkKDcNCSucFgiXimemhTreal2DPBMVFsxQc+IsYKgBClYdxB
         6cf8JEtef8AbeXQasMVrLgL0G99aHGdRPZGOeUdlJdj82nU4MEARNAEQvN+d4Y9qHdFX
         qZsNNiPNdwLw3Je/8fa099X9cdvu1nftlqEVrrygPkKlRc6CigwlfNjen8rD0DCCWJus
         GmaH23rdsdhGnstz5pzu2/YqVtX7bOdVqc4qsIkLGSfjJW3FICaPK+wa8YUZUGQQww3e
         p8HtiWH5ulHNs20l754GVEzv1Nq2j0S5SI0nGTAXF/uVm7Jv06zcsvky0F/wfEba6j8M
         rcHg==
X-Forwarded-Encrypted: i=1; AKwUvByM2s278JeUeB8m/l5ylzrQSy7d/EeOafcmclJJ3mcCEpPg9R5nKz/co/1Vrj7FCk2JsKJmkw==@lists.linux.dev
X-Gm-Message-State: AFuF++n5Nl8tvDMS3w0LdhB03T0nrEeFNoGwRWrtqHiJiOOwXMBE146L
	vkior4juNwz/sYuL7eZq7xnU8Y0Kpme0hmRe5tepPrR8R7aRvMlIw/IbjcNjCg==
X-Gm-Gg: AYBFou0n5ojLfhMBNsrW/X1a6kPxaDYuRM92EGeZ9IcsEchckK/1czQr+ioibNCNjoa
	PGj5j48Va3PNaWCCE/okdRQPi7OMKPJk+5t+oHI7UMEkgF90DZJ0oRBO3nOZCt5VAmRMsR78m6a
	OEZPRc+E6F72zYat8lAnHnluFcb9AgIini0TQseRDOgn3y8w40Dom7M6lRn0I/7aRRlj2tnC8a0
	rdBdj4txVCVVgMmeqKEfPTpY62yzYsbZlWU1ED+zo/eS/MmBdqsvEOWPfXYdfRBt6a1seS4szDk
	1Iv/YfbHSemzGhx4OAcNCCg7szzCo5XuSPedbp2UFsYaOueohTbH9z+T/sHly/hkgyy8jaPq3t4
	Ll72EjMRv+gj0g0YCJSznOL5ssT8kTUjX3Y2dDPKlBbb1+Dp4OosuYoxF/lOKTUKXw0UoRg1d2c
	ng4nHG+A2D/rFMeQS4b51o9tt+MajccCh0k2cQ+RtExAFqE9jhHdTtlEwTqNUDbbUdISsSTfyN9
	ctf8H/lBNn2lWPPmX/Gwsjq5t3GVSqc5dWVgskhU3jx5ngmkURI1lgxJdXO0RAhFkCj5fat0QBo
	83VAIIq2r97M+ncd9QnmGtpsQur2I0eVXHMdWUlv5DOCmc7TZv/emovvaA==
X-Received: by 2002:a05:6808:f91:b0:496:892:c58f with SMTP id 5614622812f47-4ca497b2b63mr462332b6e.2.1789511785582;
        Tue, 15 Sep 2026 15:36:25 -0700 (PDT)
Received: from mail-oo2-f38.google.com (mail-oo2-f38.google.com. [74.125.231.166])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ca23059f22sm730613b6e.5.2026.09.15.15.36.24
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 15:36:25 -0700 (PDT)
Received: by mail-oo2-f38.google.com with SMTP id 46e09a7af769-7f4f0d37dccso131231a34.3
        for <asahi@lists.linux.dev>; Tue, 15 Sep 2026 15:36:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwaSJAyuALhDboVfxFFjCBhsLTP7xWArfzWz8gy79IQPKZvyYhWqtBkcwlRVwzzEcPRBZDMkg==@lists.linux.dev
X-Received: by 2002:a05:6830:2b0a:b0:7e9:e709:44f6 with SMTP id
 46e09a7af769-80b2c5a740fmr490576a34.12.1789511784339; Tue, 15 Sep 2026
 15:36:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260915-brcmfmac-4way-handshake-offload-authenticated-event-v2-1-fbb9cc7ac177@jannau.net>
In-Reply-To: <20260915-brcmfmac-4way-handshake-offload-authenticated-event-v2-1-fbb9cc7ac177@jannau.net>
From: Neal Gompa <neal@gompa.dev>
Date: Tue, 15 Sep 2026 18:35:48 -0400
X-Gmail-Original-Message-ID: <CAEg-Je_YwUiMGp824d_xSFu_tveO8fhg8iFkbF4yt+p3ZavgGA@mail.gmail.com>
X-Gm-Features: AcwNN1W2qt9nnEEFJwdUZ2bbqC9KmYt-CX0tJb1UVyZt85fT9jD1BRVwzLovmLE
Message-ID: <CAEg-Je_YwUiMGp824d_xSFu_tveO8fhg8iFkbF4yt+p3ZavgGA@mail.gmail.com>
Subject: Re: [PATCH v2] wifi: brcmfmac: cfg80211: Report port_authorized for
 4-way HS offload
To: Janne Grunau <j@jannau.net>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>, Hante Meuleman <meuleman@broadcom.com>, 
	Kalle Valo <kvalo@kernel.org>, Pieter-Paul Giesberts <pieterpg@broadcom.com>, 
	Jason Huang <jason.huang2@infineon.com>, linux-wireless@vger.kernel.org, 
	brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com, 
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Arend van Spriel <arend@broadcom.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 3:17=E2=80=AFPM Janne Grunau <j@jannau.net> wrote:
>
> Since commit 416386060 ("Mark authorization completed on driver
> indication during 4-way HS offload") [0] wpa_supplicant expects
> NL80211_CMD_PORT_AUTHORIZED to complete the authentication when the
> driver supports 4-way handshake offload.
> This was apparently never tested with the upstream brcmfmac driver as it
> does not report this. This broke authentication on Apple silicon devices
> (BRCM4378, BRMC4387, BRMC4388) and other devices when wpa_supplicant
> 2.11 was released [1]. This was initially dealt with by reverting the
> commit in Fedora [2] and other Linux distributions.
> Instead of carrying the revert over to wpa_supplicant 2.12 add the
> expected NL80211_CMD_PORT_AUTHORIZED when the connection is established.
>
> The "Fixes:" tag is not fully accurate as this has only became an issue
> after userspace changes years after the change. Since the change is
> expected to be required in all active stable branches for wpa_supplicant
> 2.11 / 2.12 compatibility it is helpful even though
> BRCMF_PROFILE_FWSUP_SAE did not exists then.
>
> Link: https://github.com/zephyrproject-rtos/hostap/commit/41638606054a098=
67fe3f9a2b5523aa4678cbfa5 [0]
> Link: https://lists.infradead.org/pipermail/hostap/2024-August/042893.htm=
l [1]
> Link: https://bugzilla.redhat.com/show_bug.cgi?id=3D2302577 [2]
> Link: https://lore.kernel.org/linux-wireless/20260911065656.1269623-5-Jas=
on.Huang2@infineon.com/ [3]
> Cc: stable@vger.kernel.org
> Fixes: b8a64f0e96c2 ("brcmfmac: support 4-way handshake offloading for WP=
A/WPA2-PSK")
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
> Changes in v2:
> - rebased on wireless-next with "brcmfmac: add FT/OKC roaming offload
>   support" applied
> - updated commit message
> - Link to v1: https://lore.kernel.org/r/20260912-brcmfmac-4way-handshake-=
offload-authenticated-event-v1-1-e41a6a8281a2@jannau.net
> ---
>  .../wireless/broadcom/brcm80211/brcmfmac/cfg80211.c  | 20 ++++++++++++++=
++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
>

Looks good to me.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
