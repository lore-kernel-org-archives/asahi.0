Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794594306;
	b=NSTRQ8Fww9Hgenf8dUDyHpt9s3Kc3fUCJMy5V0cT7UWNJ0iwvW0ciNh2rsKJrOCx9vnk
	 RrDDJeNQdN9P/wQmf+mDRaPAY6HQmulY/TLj18iy90gSX97hRfxDIoLN5hd8n4KMuhVKA
	 sNbwDtUKggA7V9p19ep1QjUm3FE5pw/4vG8h1pq1HBCCizsWkZ9+4ccvAMMRQA+h4aLMh
	 b3F3q4Qf+gCC7OzsSZcFLt6T488HBB+6uBbla0BXdgEtDYr3n1pMzGanAA5fVrF8SvqbN
	 V4QRbGa45nvj67cjMsNxhP23zVKHIzQFx4aY6vt9f7M2882xBdnjODFowY7ik9PrpGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794594306;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+4+M6Qf8kgsKLvqCkp78aI5bxXP1So+oEpWQ/VILqxM=;
	b=po7ACQsc/b2fP1EGL8mwDYM1OyWow0fkwvbbrguR+FiHkS0TahzyA7pfNvIOQbIZjVNi
	 JrY20NHU746C9b7nk509aEW+NZXtJE8RuRffJa6/YZa4iq2m+oAEwt4okASr2gUqYDF05
	 jxpIjvauxi821XURPBmyOGlcgLXcBgUAF9VTce3BVXH9X7CkAPtLnbRx+c5x6Fz6wNTwM
	 cq4BfLOKC6h0OgReOKLs4vXMkET+FckkQL1snjkabIStTqpnvP0Uk24w1KVrrS/7SNFGY
	 pJdMqxkBHw4R2SH7CEdntKTNa/kkkoqAo8dmhvF1aXadkxJh0bHSZsY+uI+RZczUKzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gompa.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF07606A323
	for <asahi@lists.linux.dev>; Fri, 13 Nov 2026 18:25:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CF07606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-8628b63dd60so393794a34.2
        for <asahi@lists.linux.dev>; Fri, 13 Nov 2026 10:25:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794594304; x=1795199104;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+4+M6Qf8kgsKLvqCkp78aI5bxXP1So+oEpWQ/VILqxM=;
        b=NG6nP1Eg8YmQIxhmtVO9PQGameASpIuEdiuruVnEzqEtmfwVVodX9GKlsMNV1z/9JX
         RJCYonq4A4denq81Def8/JH7c5B9LqY2U4666k6OQceDr3WeMrG+9g9q+y6HIXbAaV7m
         /JBhiAn3qRe/R460yzJgb5RYjD0iC20dm6rN/xTBFAYigfNjreHTiitCuAfnBzG1/vmv
         0isOmrsM8xzsY+3rE68v5CjfUHbntHY/vBbQP2ALJnv1IIcvcoqr1vdJyeom/rJ7sjgc
         bpN73wZngJxvU9MogDRbo1uyhA88y9anwXbUBDJX4QZFPuMft9EqmUWV7nV6oG8qI9IJ
         +e/A==
X-Forwarded-Encrypted: i=1; AL+hErEJh6P9G/1TiS50a9Qjb8saaYWfbjH9/MaEdLQv9DAZaZ935aXyCoYLlRDQ+nkH+U0KpeKduA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/FvpNwD5Caa40WLm1HAnCWBpczpFm/fccwAaFUcuR58Sms9x26
	GBFCqGAyOTTjtUIipUvm4klQ8oCg8VrHgKipMpxUBX0GDkocjfWaNWRpz97X2A==
X-Gm-Gg: AYBFou3QVzdnRLhHfKTghjImHL3Ay2NB3/F2KsugA+Rtd8wxHVbJEJ0Ax6G0pu/GgKM
	wARDy518MjmwvJwR7+gKy6GYItV/XjKzOhlTXsMvFAgzV3AXVPoppLcBfC6rwQGzhNhoknc7rTW
	qAHKgrNB/CZt8pYwxVg9QP7+8WTRLn+SpHl0rE5PtETcJ8s/wRK60CqPbvrUD6Ja3whERGMVKWx
	r4+oDxBjTOMviQ1Z3vH1Bo6odkEZzrElRH+Ymw1AJyO4/Y5hWlE3HwHukpg7ipNP2F3JQF28bVi
	xs3eNU0yBpFlngAA29pjcEo3FcuG5YZt1lG1PrT1cxdOf26Fifs8gfYBzyT+YxxppgfoE2R1UoA
	rcDFILdrAs3XWvdMPc84MPl0d5uy8Ke04U36c5uyamkb4OXIfGg52o8Lj2tRomAG7cn9YDEX/1o
	pvt3eyslMSu8Fn9E+g7BFqpCHjWmYNEGXZO77eRLIyaEvseNi80fEELAo0Mqb5cf/huzifgHsfl
	vAWEufyNNgB2PbEkn/zZLCz3OTgTgkq+oEXDxy6yvnOFaMp7t64kQtKHKnoiriQP18WbFq30jYC
	TqYpv2qzQFCkG7awCFG6BWMIOgiE4y1tz6pdkh3bPLyN/Tnx8kizsBuQHSI0cjlmJgWlovIOl4z
	awASmLV4UwRW0NPEB9mnUY2J3Uobh3qz6S5D9wynZb93gTydllhjkg+nnxH/C2KEWVwlJHKpP2K
	KK
X-Received: by 2002:a05:6808:1486:b0:4d3:6be7:c64a with SMTP id 5614622812f47-56e5cff0630mr2927166b6e.0.1794594304552;
        Fri, 13 Nov 2026 10:25:04 -0800 (PST)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com. [209.85.210.44])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e6b195b80sm2763868b6e.0.2026.11.13.10.25.03
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 10:25:03 -0800 (PST)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-8470d7d430fso528902a34.3
        for <asahi@lists.linux.dev>; Fri, 13 Nov 2026 10:25:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF8gLyBJytnxtZMiW1ziEUjZNifkO9CjaROJEOXYVjZOu+Ztf1TxPKaevZFXGokL/WeVY2Kog==@lists.linux.dev
X-Received: by 2002:a05:6830:2695:b0:83f:f24d:fe19 with SMTP id
 46e09a7af769-8628979e65cmr3203276a34.3.1794594303480; Fri, 13 Nov 2026
 10:25:03 -0800 (PST)
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261113-6ghz-v1-0-0b9a67e413a9@gmail.com>
In-Reply-To: <20261113-6ghz-v1-0-0b9a67e413a9@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Fri, 13 Nov 2026 13:24:26 -0500
X-Gmail-Original-Message-ID: <CAEg-Je9XODS=vU-tjZev90Rng6D_B+9vxek96mV8yUpXwoQ7GA@mail.gmail.com>
X-Gm-Features: AclHuK9fW5jJ3rn5jJzhWh_iZufJsywX71GMdWHbE-bhsHtoOzuaNfj98eY9hCo
Message-ID: <CAEg-Je9XODS=vU-tjZev90Rng6D_B+9vxek96mV8yUpXwoQ7GA@mail.gmail.com>
Subject: Re: [PATCH wireless-next 0/4] wifi: brcmfmac: Add support for 6 GHz operation
To: michael.reeves077@gmail.com
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>, asahi@lists.linux.dev, 
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev, 
	brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org, 
	Daniel Berlin <dberlin@dberlin.org>, Yureka Lilian <yureka@cyberchaos.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 4:20=E2=80=AFAM Michael Reeves via B4 Relay
<devnull+michael.reeves077.gmail.com@kernel.org> wrote:
>
> Hi Arend, all,
>
> This series adds support for 6 GHz (Wi-Fi 6E) operation to brcmfmac.
>
> It includes HE capability advertisement, 6 GHz chanspec and band
> handling and PNO version 3 support. The PNO support is required to avoid
> channel-number collisions with 2.4/5 GHz during scheduled scans.
>
> It is adapted from our downstream work in the Asahi kernel by Daniel
> Berlin, but reworked to make the code cleaner and more maintainable.
>
> As I don't have a 6 GHz AP to test with, Yureka Lilian tested this
> series on my behalf, on her Apple Silicon M3 Mac (BCM4388). Connection
> and use of a 6 GHz network was successful, without regressions on 2.4
> GHz or 5 GHz operation.
>
> Thank you for your time,
> Michael
>
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
> Daniel Berlin (2):
>       wifi: brcmfmac: Add support for 6 GHz chanspecs
>       wifi: brcmfmac: Add support for the 6 GHz band
>
> Michael Reeves (2):
>       wifi: brcmfmac: Advertise HE capabilities
>       wifi: brcmfmac: Add support for PNO version 3
>
>  .../broadcom/brcm80211/brcmfmac/cfg80211.c         | 477 +++++++++++++++=
------
>  .../broadcom/brcm80211/brcmfmac/cfg80211.h         |   2 +
>  .../broadcom/brcm80211/brcmfmac/fwil_types.h       |  68 +++
>  .../net/wireless/broadcom/brcm80211/brcmfmac/p2p.c |   6 +-
>  .../net/wireless/broadcom/brcm80211/brcmfmac/pno.c | 147 ++++++-
>  .../net/wireless/broadcom/brcm80211/brcmfmac/pno.h |  41 +-
>  .../net/wireless/broadcom/brcm80211/brcmutil/d11.c |   7 +-
>  .../broadcom/brcm80211/include/brcmu_d11.h         |   3 +-
>  .../broadcom/brcm80211/include/brcmu_wifi.h        |   1 +
>  9 files changed, 585 insertions(+), 167 deletions(-)
> ---
> base-commit: 3c311bf321442d4c4f452a1a08bc9efce242a1f9
> change-id: 20261113-6ghz-a8d587ab3cce
>

LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
