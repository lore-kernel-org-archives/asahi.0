Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BB812E7F
	for <asahi@lists.linux.dev>; Mon,  2 Dec 2024 16:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733157403; cv=none; b=FsTzl3k77cjMFXzRWcCXnnqGYbiWcidELp1ICIPoFwqObR8uaAEqo/VFCBCmu0mWh7kPqBKufD0LwNi+AJWN/idLzltGD3MKOMlWqz9Pa5d4SZM6Rri28xGJPsIJIp4S/yrdZ4jiBrIb95xWF7tHUFszVj9qXjDbw8AxISQ/RwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733157403; c=relaxed/simple;
	bh=3iIxLX8MdJKmfYZx84Ifi8jJEfVuHKL2dEYMIadupn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eWGm3FBpMoQHyVHD/X+dlzY+lNWtKNk/pOFIEBY2U+Nc50GbbXjFwv9Wb3Yev3/jDAX+XV5GXNEIUxvjiyLKkfMa7aWSYw2iXmrrwqmjU5kzk9dJSLTB8e73FBB01X6wC5DAix9XFgYv16AXvVr+7aAVtj+AiEAuT3dCWpB2Q2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R5pLnOcu; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R5pLnOcu"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6ef7a0b65f4so14533917b3.3
        for <asahi@lists.linux.dev>; Mon, 02 Dec 2024 08:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733157400; x=1733762200; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3iIxLX8MdJKmfYZx84Ifi8jJEfVuHKL2dEYMIadupn0=;
        b=R5pLnOcuPN/2zfZi8xnI2D3aMkGpqEs5zlFR21EE5qxwgdzilP+Zssqc6ZB0YIfLgh
         MUvLgPYv64q4z1xxMbPuQFcWysAoAcJ3zf9/FO9EKq4uWE+M8Le6rgvl+DV9Mk1KNAnq
         xiytOlAYnWHWP/0uwAOQ6VEFlHQeDxmk86GZF3aFzS8MvTu/WOMv0q6oSbkmt/RXU4wu
         uB899fQrxFJxYoVemld7OrZX6oMx3Sk1bq7eEL/ItIkBO9lmcSxzadFCwYJNm9PFNGL0
         OSVR9rdRqSzPlrAtavAobcBQzXKcHOi2fkowIXmJaDizwraEn9oQuR0yk3XdfiDJY8Qk
         VUZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733157400; x=1733762200;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3iIxLX8MdJKmfYZx84Ifi8jJEfVuHKL2dEYMIadupn0=;
        b=KuvsFgNVQyckxYUoOi26OoUFpnOhY5+XKLQJYu7g1tJXVjYFREQDY2IIeRZ8NC2ybl
         zLeas61AZR8+9Q0XtrwlRASQO9pnVpGZKjLmqBzQVb6xXqrKvICRcOxgiMu1q+m0Ge1i
         dth5IrR7flFMucdewKFXTfJXmkeGEiCogViUsjC4ctT9BPyOQBNLd1ZZBZqMbvnL0QiJ
         zU98m03mu3lKdFKnYbRL4AUSO+aCrbiBMK5LV7NPNfZtaxfkcBIQFtR1IZkzZghIWrWK
         y7BfCf/li36Y1ztGlsu4UqxAly3e0wL3Ynk83hoqK4tG06t2PU5RGMyd4nqBss8d/qga
         Ap0A==
X-Forwarded-Encrypted: i=1; AJvYcCXcJpX3wFdmvaTjj/rmvONCj0lofafkuKx5Id7VC68LJze57DesyihfWTdVgHMow8MUUYZcJw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwVgBT0byznU8sJ0P8RQQG3YJAjano0Hj4Mt/jOo2GwkkXID63u
	vCEf1HMgM0QFiAGuj+8rg8Ar5EFtdbpZ3ytkdFA41tUkykbm/02voRYSYNJYlUpwhPpP+iA7AA3
	2PN6Hml1HdCDa2N7Eqlq3xiSWNEs=
X-Gm-Gg: ASbGncvJKPqnbHD+HoG7QXVwblUqIMsnqGkBjgH3aHHdAnhraqhNcDjYherC/aEt8Fz
	o2OeN9ce7J65mNo+MpGLmX2xP9InAog9x
X-Google-Smtp-Source: AGHT+IFQ4i9gEalC/d1K/SdeClnhnHzZj+IX6cR1THj7nWjoIltHkFk9vX6X4yTjjoj8SQHlC0zxj1n3y1n377U0g9Y=
X-Received: by 2002:a05:6902:110b:b0:e39:7a90:eed0 with SMTP id
 3f1490d57ef6-e397a90f42emr15007609276.44.1733157400328; Mon, 02 Dec 2024
 08:36:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241124-admac-power-v1-1-58f2165a4d55@gmail.com> <Z03f08Os/csGbMap@vaman>
In-Reply-To: <Z03f08Os/csGbMap@vaman>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Mon, 2 Dec 2024 17:36:28 +0100
Message-ID: <CAMT+MTTFkVcZHoC77BAVc+R_rvDfhoSQZujic9SCCqb8OkgSew@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: apple-admac: Avoid accessing registers in probe
To: Vinod Koul <vkoul@kernel.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Dec 2024 at 17:27, Vinod Koul <vkoul@kernel.org> wrote:
> So looking at the driver, there is code to turn power, so what ensures
> that power is up while we are in alloc callback

There are two devices that use admacs, mca, and aop, with aop
only having a downstream driver for now. Aop's admac is controlled
by aop firmware, which does the power switching. Naturally, that firmware
has it's own idea of how power is supposed to be managed, so we can't
sequence it in such a way that the relevant admac has power when we
are running probe().
