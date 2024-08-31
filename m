Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3622017BB19
	for <asahi@lists.linux.dev>; Sat, 31 Aug 2024 11:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725103601; cv=none; b=URRv4ts7c2Hs5X4Z/iihdzyCPnSomLRIBmnTFkqjQnDihSCXcXtwALtt2UoDWYraW+qOdxvuQU7fusQ0uGBnFdVCexB+JLfRih2QP0525YSjRD6oIXbGRXauRl7GWOhGAD2qMe8X3/o/HeZTX6kDAxhH8fxes/se8WQhltKQ2Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725103601; c=relaxed/simple;
	bh=ZvbGp0mAKFAUDmcihLLlDp0OuZrzBX+nmwBkND+95xE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fQLbVOYI0GUA1in2RwGdrcRugw3XPlqZi+41I2TK3ZhroBciEkF8mGUo/dF1i6hUXPKmjGyVqJLbJqWFF/2eMOW8ihG+opROrEce0Q2K0YfpzXo5S7hLGtrVhPS/FNddjCBrfCi2by4et0yrjUcuyzuayiqtCkzeHjre8modQuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a86cc0d10aaso294465666b.2
        for <asahi@lists.linux.dev>; Sat, 31 Aug 2024 04:26:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725103597; x=1725708397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZvbGp0mAKFAUDmcihLLlDp0OuZrzBX+nmwBkND+95xE=;
        b=qkqnvoQ2mtQ/aiFWTXOBKjObhCmY16vAPQfnQfc2iQSNC3N/SmkLaDboKjsr/a2QK9
         9TWevxeUiEpo8OYfS0GP387jLGpvR1fY5Ukq1XFBAik5IQTMeFBNQhJs3MrC87m3hfD0
         WULsm1aP60u6WUtORMKFCH+z8a5dGs/9QWh1u1IJ9NZ5UjdPVkRrL4ePgztvodtaHoAQ
         o0Q3FIvI3j5DVDGdZZiw73ELWSOH3OO4gxOJ8FYURznJMnE+0TphWGmhqlM5sy5gG9eR
         zZOsXJUvd8P/Az1MkA1ZKvcvKqSDUFiO4kAT8Ed4iE60/0uAizOaJWaAYBjDcam1UD4v
         ex/g==
X-Forwarded-Encrypted: i=1; AJvYcCVrqArr6uusGq954JecDUvMm24LwYQqNnnoBAlJZ4cgKYyClh24iFUZPYL0xRDNJZsIZpW01Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwrEY2tkgJTTiVe0IbUA12h3Gc2QA6A8CowLiopbQV5LfHXw1i5
	DXRFSwqGJZJwwMBYV+h5BqFP6doUaBfZ6WoFyEgQ4l26ZOBWl/lrwNOdZtkB
X-Google-Smtp-Source: AGHT+IFnw8KHoGhbVbr5V0TT35raavJNQ94egN0FoAPxT0MssHnZVcZo3SqM43evt1Ci0U9EGJsirw==
X-Received: by 2002:a17:907:72d2:b0:a86:c111:cc35 with SMTP id a640c23a62f3a-a897fa6bb45mr688453066b.50.1725103596631;
        Sat, 31 Aug 2024 04:26:36 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8988feb410sm316037466b.21.2024.08.31.04.26.36
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Aug 2024 04:26:36 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5a10835487fso3692231a12.1
        for <asahi@lists.linux.dev>; Sat, 31 Aug 2024 04:26:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUc/83bfA5PyL04XPQ7yXq+QxX3BNZfU62ow5VshYlNG9tj48Y4ZhfARVeZD1PbLUD3Qp+ZVg==@lists.linux.dev
X-Received: by 2002:a05:6402:2714:b0:5a3:a4d7:caf5 with SMTP id
 4fb4d7f45d1cf-5c21eda33d9mr6746821a12.36.1725103596088; Sat, 31 Aug 2024
 04:26:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAEg-Je8=t_cXKsWL0XSx3vF1gsArSWpychfbEf+yjM6wVz3Mjw@mail.gmail.com>
 <CAM22NNBrXSUbrpFAKv8jrREKTBYx_aW0cibtDE5AZ_kTijUrPA@mail.gmail.com> <CAEg-Je_9r_96j-un6TS7Dm_kJ3m7Q6y_RDEs9NTvxjNJM-zEvQ@mail.gmail.com>
In-Reply-To: <CAEg-Je_9r_96j-un6TS7Dm_kJ3m7Q6y_RDEs9NTvxjNJM-zEvQ@mail.gmail.com>
From: Neal Gompa <ngompa@fedoraproject.org>
Date: Sat, 31 Aug 2024 07:25:59 -0400
X-Gmail-Original-Message-ID: <CAEg-Je-yfKSvHVnyJDmD9fprKX2kw9icKcG0SipGTUvjivwL9g@mail.gmail.com>
Message-ID: <CAEg-Je-yfKSvHVnyJDmD9fprKX2kw9icKcG0SipGTUvjivwL9g@mail.gmail.com>
Subject: Re: Weird failure with bpftool when building 6.11-rc4 with clang+rust+lto
To: Matthew Maurer <matthew.r.maurer@gmail.com>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Quentin Monnet <qmo@kernel.org>, bpf@vger.kernel.org, 
	"Justin M. Forbes" <jforbes@fedoraproject.org>, Davide Cavalca <dcavalca@fedoraproject.org>, 
	Janne Grunau <jannau@fedoraproject.org>, Hector Martin <marcan@fedoraproject.org>, 
	Asahi Linux <asahi@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 5:45=E2=80=AFPM Neal Gompa <ngompa@fedoraproject.or=
g> wrote:
>
> Hey Matthew,
>
> The current thinking is that maybe the culprit is dwarves. We've
> backported a fix in Fedora that may help, I'm waiting to find out if
> it does. Apparently all test runs with Clang+LTO are broken right now
> with dwarves 1.27, so it wasn't just unique to my merge request.
>

Well, that didn't work. The backported fix doesn't seem to have
resolved the problem. I'm at a loss now.



--=20
Neal Gompa (FAS: ngompa)
