Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8E539DBD0
	for <asahi@lists.linux.dev>; Fri, 17 Apr 2026 12:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776430594; cv=none; b=UJjH3pEf+Bh0yyWQZTj1nkj/0Y+NUpQm/fMo1YSiQcWz62hUsWGKgVNeN6y7itJZaAxq828eQl6hwko4qDmvGx5LLUAyzG2OpEgIHm3RSTnN9lXQmyQoW7ndrBXsC6mi28sxNsJIoxzaEAFQvBP8C5HSDU/0MeGi6/9qX+ElRsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776430594; c=relaxed/simple;
	bh=Q8NsFEG9ZbxpVev0FTO8qLeWdg9a7p4e0wi67qPhdss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uBvnoug54oylCwVpK2P6arwdeuhhTtR6g6YoOFIOqdKU8YjdBE2naOgEeU5qtdrM9MJ56DOdLC/SpFXltJ+bv4pQ+KuHCSMwOqdzS3sidCJByyXXo3f9qn4JovtQ5myF+KXERQM21QrLGV2SU5Dj1KX/8TM+YzPjK26iZStw/mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-691de293326so344300eaf.3
        for <asahi@lists.linux.dev>; Fri, 17 Apr 2026 05:56:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776430591; x=1777035391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cQ7E0BVCzrZ39XOhVCVYNxv43US7LndGBNHCx5jFIzc=;
        b=g8od9QrCIPPXufYMlIsgfPmlZNFYGjjpPw1cJYRlDRfuBILJQTQrkj58jlHsKkxED3
         BTxHEcKh7jN33RaaDnC6JfIrl18Du43HJ5GYHDY4QZFThuXvwu2UkSrZUswTIwmbT8eL
         FTdWNWzXExLRX0LvsrHm6nVft20fwNt/cdJKEn47J5lRGesjlxzlfTllw/kdlNICwJh9
         AQVfNRHDAr22FrIrgCHioj87XcHfvbbvseVY+h2eKD7e2LRC4qHvf7hxx7KyCU4txcUl
         uuvzKcTH88DJje05mZEjrJL3dFdvqPewoYaUltwFXhjpt87V+LVGGqOi2pe5NQNbHvNM
         BDbg==
X-Forwarded-Encrypted: i=1; AFNElJ/87ckvTMUpQxNNc4KKzOWF23noW/EuFGfUH2toJBhhwebJ7FmonPjZpyKkIT56dNvr+Hw/yA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7AN7+5GysDKUZu2yBWK+a/ZiUuoBUsmJGadMJmY2QRsc9JLMs
	TNXbGjaVMcsTnArg9AGspIHKcE/fNO89tM/x5hLSN4MOBF9rdr3dffHwfxT5lw==
X-Gm-Gg: AeBDiesrGqI/3B4sXaZXTpJNwfJKW3lXeBfggkF4yMX5Ww/jVK4ft48+EOS9sFQi9r0
	V0wLY/Hw6mUt93S02VdxxGV3eFTM0YhWm5EaBVQ2cnzI3EZV2VGRj4Lu4OZs43IuiXQPV1f9FwL
	cOmKfyv/AT6MfTtEeVKcu8sOrNsd7t4/m743bIUn6oIyGsX4wnqk+6XrOARRe9n2Saqvl/ftJsd
	pJu/1hcMEVuG1yc26AUFaCWxjskyVqPZAoBh0c3tCCA0lTrv2oLXgyEDWgJ2MR723JC+l08ZpAv
	YtI1R/QVAB6HW4x0+Ub+SL6LQpTHRaxtAvqRhwxSkuG/M43mL27z9KVrt3MvLlXNiFrVvO4xlB8
	9ksJ0NEcfLMZjfgHKGlbTfjS/4FfAV/md5ER8plqul6f9+wtzI451qsk5gDpqLaSQVCM2UgHdVN
	E3nmWWeHQCgYOF8iSIn/dE8nHfHJkS74Tjp0Z57+VIDaXMG7RhbF5c9yruOGYmNA+l3+Lu7nhYI
	QFTZphKtsi/PJB0d78o6Gy6k6X1cZX9/PI/QMGYCb1moRXxx+XrIX/x9sJ0KdiyqPvB6fy++L4K
	6T0N/gY4QA71+0l3vYM=
X-Received: by 2002:a05:6820:5104:b0:686:48b7:d81d with SMTP id 006d021491bc7-69462e39623mr916411eaf.15.1776430591342;
        Fri, 17 Apr 2026 05:56:31 -0700 (PDT)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com. [209.85.210.46])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69464e5e58csm894320eaf.1.2026.04.17.05.56.30
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 05:56:31 -0700 (PDT)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7dbd2a0211bso495746a34.0
        for <asahi@lists.linux.dev>; Fri, 17 Apr 2026 05:56:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8tyg50yc7PC3JnV94VSCWmTgHL++sf5cwOb0pS3HmSYGsCYiXYUv2OTG9mIczOiClDKcC6mA==@lists.linux.dev
X-Received: by 2002:a05:6830:368b:b0:7d7:d2e4:630a with SMTP id
 46e09a7af769-7dc951c7534mr1574853a34.14.1776430590793; Fri, 17 Apr 2026
 05:56:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260417104639.2608008-1-tristmd@gmail.com>
In-Reply-To: <20260417104639.2608008-1-tristmd@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Fri, 17 Apr 2026 08:55:53 -0400
X-Gmail-Original-Message-ID: <CAEg-Je_X1bfKwE44PJdgbHHZtHVy8bt1gotWsqkAWsS5s=_irQ@mail.gmail.com>
X-Gm-Features: AQROBzCi0gDy3D7m8PPBy3zcjwXiwPzD0sMHzUSSerDbzRMjjnlKfNBi1eGHZ2M
Message-ID: <CAEg-Je_X1bfKwE44PJdgbHHZtHVy8bt1gotWsqkAWsS5s=_irQ@mail.gmail.com>
Subject: Re: [PATCH v3] Bluetooth: hci_bcm4377: validate firmware event length
 in completion ring
To: Tristan Madani <tristmd@gmail.com>
Cc: linux-bluetooth@vger.kernel.org, luiz.dentz@gmail.com, marcel@holtmann.org, 
	sven@svenpeter.dev, marcan@marcan.st, asahi@lists.linux.dev, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2026 at 6:49=E2=80=AFAM Tristan Madani <tristmd@gmail.com> =
wrote:
>
> From: Tristan Madani <tristan@talencesecurity.com>
>
> The firmware-controlled entry->len is used as the memcpy size for inline
> payload data without bounds checking when the PAYLOAD_MAPPED flag is not
> set. This causes out-of-bounds reads from the completion ring DMA memory
> for the HCI_D2H and SCO_D2H transfer rings.
>
> Add a length validation against the completion ring payload_size.
>
> Fixes: 8a06127602de ("Bluetooth: hci_bcm4377: Add new driver for BCM4377 =
PCIe boards")
> Cc: stable@vger.kernel.org
> Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
> ---
>  drivers/bluetooth/hci_bcm4377.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/bluetooth/hci_bcm4377.c b/drivers/bluetooth/hci_bcm4=
377.c
> index 925d0a635..5d2f594c2 100644
> --- a/drivers/bluetooth/hci_bcm4377.c
> +++ b/drivers/bluetooth/hci_bcm4377.c
> @@ -755,6 +755,13 @@ static void bcm4377_handle_completion(struct bcm4377=
_data *bcm4377,
>         msg_id =3D le16_to_cpu(entry->msg_id);
>         transfer_ring =3D le16_to_cpu(entry->ring_id);
>
> +       if (data_len > ring->payload_size) {
> +               dev_warn(&bcm4377->pdev->dev,
> +                        "event data len %zu exceeds payload size %zu for=
 ring %d\n",
> +                        data_len, ring->payload_size, ring->ring_id);
> +               return;
> +       }
> +
>         if ((ring->transfer_rings & BIT(transfer_ring)) =3D=3D 0) {
>                 dev_warn(
>                         &bcm4377->pdev->dev,
> --
> 2.47.3
>
>

Seems sensible enough.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
