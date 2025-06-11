Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92B72222BF
	for <asahi@lists.linux.dev>; Wed, 11 Jun 2025 17:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749664118; cv=none; b=Zts6CzajGF0KA4WNHxVFqSEGt39q6i6IKe7Wl7yuRZHfbenokX5TH1adTqBiU3kXIWy0tabwGvYco5fCwTvwsTiLt0sFBLIAd8hTZTC1xrZTqcDjEnxuiL1qVHBqweyr+cHa9NYKjTFZxtze6zMIWrhwt1rQWg4gP5SQE9QQv00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749664118; c=relaxed/simple;
	bh=PpvQih8tMJUPnoS+0lHOgNjam/wL5Ni1Nop7KyDY858=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VYRp9t0sY805FNfkVTqOcWSRcPWpEQeIRg09FBiwWiNkAaMiLXdYib7l5yQ66OVrClNlidhHlPj7mcFkTpVcNFgLqVu4w7ljEUPfafL7fuv5Y+EZCFikeSU3dF+xddDV1TAFP7XJ/O3S0sc2UBi34veZ1lXQt3jbGoRy80Zxbgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BQrccEOQ; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BQrccEOQ"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e7db5c13088so82334276.1
        for <asahi@lists.linux.dev>; Wed, 11 Jun 2025 10:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749664115; x=1750268915; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PpvQih8tMJUPnoS+0lHOgNjam/wL5Ni1Nop7KyDY858=;
        b=BQrccEOQCsiVUtsVz9N/yQRmaUhlCBTM7lAaD6NJJDPIoYltfs7fO2jOA0hzdvhHuo
         X7juUTZ38+r4DmlrPiujX9wFkEyscmVTaBHnfuGEGDWU8Yj9fBDe4MgCkCu65+j+2j0E
         kMuI/u6TS3y0abYeDBBteRYLY365AvQsz2lXjZFUUt13MUvykNA8rgE8jq+suzf6zigr
         QvpFqNFUcECzphGl6RGkJru3Ojl5DOP7UwHKhWll276eEWwK6EYSCnplumo2IMd4nYwF
         NBU1NWRAsvfLsat/hAoV28eKVSwQi6sJot+QvYoePnbNFhbGs1X+vZ4gWyNperfPvYgW
         /PYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749664115; x=1750268915;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PpvQih8tMJUPnoS+0lHOgNjam/wL5Ni1Nop7KyDY858=;
        b=OtgOiMFy3IYLe/XtvaBau6OqRkZSbGgCpi0KeQi+XoKw4lIdJl1DfrzJlrT6mssNtl
         7LYTtqpLoDrXKtfERiyfMb+ah8LMREXMooRqSieNdSfoH6wt3cehKJLvsHovVIH7g/cj
         FMHZkybBAaHLeGCHZAykwdcto2VqSOKfRpPQB1ityUW/Pc7tiruLoJg2bMyXoTYJjaGj
         EwUtbkV0M+vm8tWoaMl3pxSbF+JcUbYax5FXod8XeKFJgdV9seLnUPbBl9bFGjV8WT+B
         m8xWEOCus2KBe4TH6UcZ+aonglnW2IEfp7EIQ247wSeVpNMR6Rsgwaw7GElP48mzRd50
         uYvA==
X-Forwarded-Encrypted: i=1; AJvYcCWRiIJOPQiJOa+DEoZF0j4bKe+Wf6uOa5Ml50Rm3kL+0wFG2BlKh8LqeabALoqnkb53rOTz3w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyWozecBaHvwKhE9I2MJUH4qJ5Nyz+I8wUaO9hEu2cpNKaAj6Bu
	O1cdH+SE+Cdh6jcL6LcQSh/VYgDjnZR1tJDFSL1QwyE9Vb4CqvEos1wLLpWjneulj7qwZTuGZ0J
	4qGnlg1RzdlxqkCxY6+ove0XWjLlYr4k=
X-Gm-Gg: ASbGncuVmH9wnDz27kib0/sWa2LXrhw0tg4fBs7j5tsrRlDhcp+OxAH8i30qzRSij6g
	IJLtxgn1Sl4cTnI8v/YYlK3pmkzQSCkAN7OnENp2CRTiTv3d/00wdQ5BZSHjL5+UxZkevfw5Xau
	mXqiiJXkVkvAuxou4bGbB6Ze5zYObOweLoYLPWImBa9rGY
X-Google-Smtp-Source: AGHT+IH9DABL4wlDn/GdD9XoHB+8QanMkWBj0pjVvFYJ/W1MuhG7BWxLo4YCnNzNiDDh2Shj91H32KBlXFkEPsp6D3I=
X-Received: by 2002:a05:6902:2501:b0:e81:7e20:d737 with SMTP id
 3f1490d57ef6-e820baf7827mr480844276.18.1749664115677; Wed, 11 Jun 2025
 10:48:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250611-sgx-dt-v1-0-7a11f3885c60@gmail.com> <aEm_7NECSykMX5cs@blossom>
In-Reply-To: <aEm_7NECSykMX5cs@blossom>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 11 Jun 2025 19:48:24 +0200
X-Gm-Features: AX0GCFsfxtx0nWUUwofAcCujP5Iz-6oqoAbr15qgAOq6KTl9zDhKhhwtvESKTto
Message-ID: <CAMT+MTQ=oxfdq+tqjxLXqDUPEAHzLtJe1qy1vDBf_SA6wQ+tkA@mail.gmail.com>
Subject: Re: [PATCH 0/2] Bindings and DTS for Apple SoC GPUs
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Jun 2025 at 19:42, Alyssa Rosenzweig <alyssa@rosenzweig.io> wrote:
>
> It would be good to include links to the kernel + m1n1 branches that
> support this binding, since it's not what downstream ships.

Right, will add to cover message on v2.
Kernel: https://github.com/WhatAmISupposedToPutHere/linux/tree/starlight
m1n1 (the bootloader):
https://github.com/WhatAmISupposedToPutHere/m1n1/tree/bootloader-cal-blobs
