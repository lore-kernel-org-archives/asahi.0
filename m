Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F571A9F9B
	for <asahi@lists.linux.dev>; Mon, 20 Apr 2026 01:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776647498; cv=none; b=DwMRtQ6JViuBdmxlBs6Uga4iC/ix+KwCQhZzNVgwQAlVC/w74M/MR+UcGDD5WBBuuZB4/Qf/Olvr/amKBMBqnwTBhiCo5MFmdl+iHtUUE61sN7CPO5dnJ4RkTUHceeL21D93K0DLywJRw6I8OfdSrTGd4CVLKUv+vyZij8L2nCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776647498; c=relaxed/simple;
	bh=C0aW81I3StTCcJXehP69KLFeqWnD+swGwk+Y2hOVrM8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nNqALjFw8FXwMnLU4Z39kKCeXmBFakr2kfoIOzryTamfAtXwCWvE4XARABuotiQOEGDKbS9I3tnzBQRFoezg17zfgmY0IGsn12hDYgIkmUaD3ns/fZOkNansCUURlhIRm+/hq06z2tqY6OLm7KdY/kq8s1UOe9gRjxVvAFei4GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7dbe437b072so1470360a34.2
        for <asahi@lists.linux.dev>; Sun, 19 Apr 2026 18:11:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776647496; x=1777252296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C0aW81I3StTCcJXehP69KLFeqWnD+swGwk+Y2hOVrM8=;
        b=TqNMtwht9XI8xoBAPGV1vmzrjUwkrpFeBZcO55oQTmnVNvYfirmRSuoWgr6Hl+VC2P
         WVhkZXJxIYWN4HrbTevmn5lwli4h/gbq4LSTBNCvCSxpTDIjmW3YpcQAfMRqENHpzKvb
         siq2zr+QFgm1IMHu7zgNwjEExLT4kzl2C+c0gyo8bHFcPC/1EEPh5TM3l42ysrfXuSVe
         uYKD/qPM4mKwUtD9dcvA/Ei3iNkMhxzh5aSq1oNgtyZ2JZPunOXor58HeNGbc9tXjSwO
         0e7eBqIMenwk5nRCGHAGDZgf+/n9Nm65Qltnksdewal/maEzpCmTGDiWFp89TPyo5nOl
         GaRg==
X-Forwarded-Encrypted: i=1; AFNElJ822Fl0qW6Nx+5euvMwT7WUMUaL5bFk3J51eh74twV/bPNuvRsqY+BSJvK4K6XpFAdd9VVebg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzmBxNyf7wcIZ/F9YrxB+rsPeCdRbMXK6FKR4fzxDBmXhqDXcgN
	Hh1wsZM/GL8aRywNlsb2UR+kLa6NpzYwv3VgWreABbRPqcBbQxQdZ+lh3UQtfw==
X-Gm-Gg: AeBDiesw+qXWWZ5+lkunRuJSrqndJx/mq6hF1iJ9XQ9RorrTBrjrorTj7qStZW2aHLS
	jNJ2HCvNVQjJBUX0s+RsXFj5HScxZVR8Ig/d4XirXO489rnSlQ9lby04/+DxNjYNIRAa5FcJgYK
	1e/7mh37enCoKELCQIz6NKrnqNCtg8lfjBU2t5GvfTli5cHk9/787rNAApc5M3YkyNheHVpk2fS
	B6Jjd/qrvsz7PPc4fiDf3yN26GSdBTMDlmaRZmZxlp1gGl39xzYD/tNgbmm7zfrMjPOCjP1+Z+o
	CiF4hacSJcnQA6ltO1IrfaeQJu99AS6jxseGcmFS9mnTzYkDIJFaf/d/ecrYVOFw6t/nO7uGVEn
	etzN8DRNMKDZjlVBeVI3I3lbtkkVxuNWvyzLZXh3eU0KkosWhLLwa1HZLgi/V+UZwE8QRmWYTWt
	eDO3t+b6vx5hddH3AWmrX7CkV2sqRtyjvl+B7m6H60oQSWnfyMCGXcLrgybDwp/Ddw+snm0+PTE
	4w8KKX5ZbywPygV2ZTgS9zrunFGmQx7IWEfjJ6SgX0Imt2NJDJ6PCbWGsbGR5eGkYAR5WMz4NgV
	96u615Sx
X-Received: by 2002:a05:6820:2010:b0:687:6290:6333 with SMTP id 006d021491bc7-69462f46144mr6543230eaf.58.1776647495907;
        Sun, 19 Apr 2026 18:11:35 -0700 (PDT)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com. [209.85.210.41])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-42b8fe2c52bsm7675616fac.0.2026.04.19.18.11.35
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Apr 2026 18:11:35 -0700 (PDT)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7dbca22dbfeso1243425a34.1
        for <asahi@lists.linux.dev>; Sun, 19 Apr 2026 18:11:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8VENUMp7V6JYL6u0UBnoUuXhOy3hUGn8zOiJaMxlBCh1ttZJGDdh12ZnvXiOzpin+CkYD5UQ==@lists.linux.dev
X-Received: by 2002:a05:6830:828a:b0:7d7:cdd3:df6b with SMTP id
 46e09a7af769-7dc9521f4ecmr7107720a34.14.1776647494828; Sun, 19 Apr 2026
 18:11:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260411-mailmap-v1-0-5a519f7b00b5@chaosmail.tech> <20260411-mailmap-v1-1-5a519f7b00b5@chaosmail.tech>
In-Reply-To: <20260411-mailmap-v1-1-5a519f7b00b5@chaosmail.tech>
From: Neal Gompa <neal@gompa.dev>
Date: Sun, 19 Apr 2026 21:10:58 -0400
X-Gmail-Original-Message-ID: <CAEg-Je9WStzQj30YsRfJvp-9z1-+qbbGPxTNGkt7Kdj+XjjbUA@mail.gmail.com>
X-Gm-Features: AQROBzDnYy_QIhsEDV3LeYMU1OQV8X44CvHYlKgDLdrGKHckgRju0mncg5q_5Ow
Message-ID: <CAEg-Je9WStzQj30YsRfJvp-9z1-+qbbGPxTNGkt7Kdj+XjjbUA@mail.gmail.com>
Subject: Re: [PATCH 1/2] mailmap: Update Sasha Finkelstein's email address
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Janne Grunau <j@jannau.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 11, 2026 at 10:36=E2=80=AFAM Sasha Finkelstein <k@chaosmail.tec=
h> wrote:
>
> Add mailmap entry
>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---

Acked-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
