Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF35168A5
	for <asahi@lists.linux.dev>; Wed, 20 Dec 2023 01:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="LEPjguY+"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40c3ca9472dso59458155e9.2
        for <asahi@lists.linux.dev>; Tue, 19 Dec 2023 17:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1703036677; x=1703641477; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AKiRzNtGGIY1uHjH837oLbfNwwCc/Uk8HlilWVS2/0M=;
        b=LEPjguY+vV66/6NmUG2IwfmVYChuU51lGeQkMGwNtzITVYsq49PuUnISAneqMQoNti
         WR0O0PpNVYRf3O6IRWvsPjhPcovr3r9yfuF2Ijb+L9ccCq4E0wbuY+GbuZw/+bTPZ5pT
         P6oRcIXwM+VGjoDN4IJTaOvY7CWtucr5wc1EQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703036677; x=1703641477;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AKiRzNtGGIY1uHjH837oLbfNwwCc/Uk8HlilWVS2/0M=;
        b=e9yPr/v3zxwCAt3nwhhMWaIwxeY8hnx+cP787Wxibmiq2KCaIwk4/y2JBagJ/lkYd9
         7ewhOJEIGNoxyryglUgB0jQ5OnDlW+g5PKseADUAb5KnnTEmWpgoirIzy9KO/dKtCKNw
         MbQzrJjVLj3PCJdEseUoIAEHPLGbZ78ZYyH63d0WYNY4W3VsHctpgMaREXLqqCwTfoFp
         q9EgmCIty97gMW006W6y+57vTi6HQwa4OF8JSQpoqkNwCxeksGgq42Kp7TlC8iHaKZqI
         JQFpX8Ykmwtc6+DS9iMGjH0ACN2r8VX/GvlS4Nkl/6XOeKkVGgEp48ANqaMbL9VZQhbV
         khaA==
X-Gm-Message-State: AOJu0YxgKUU9Wg4bsWKkypTKTz3AI3jvylmJ/jjcOCmt3MIaJelnTj6b
	tskXFbeNmQvEnmggeIBbVKECN/V/l4Hhwyg2RLySVn0u
X-Google-Smtp-Source: AGHT+IFpySLOhipwfmMp6oeEprM0RVtPpR/G/MS04lDUOx/dvKZV1Fcq2AnHWvxQuVn0hjZOSV3b1Q==
X-Received: by 2002:a05:600c:3556:b0:40b:5e1a:db8e with SMTP id i22-20020a05600c355600b0040b5e1adb8emr6699768wmq.47.1703036677186;
        Tue, 19 Dec 2023 17:44:37 -0800 (PST)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id mj16-20020a170906af9000b00a2368de9471sm2156371ejb.202.2023.12.19.17.44.35
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Dec 2023 17:44:35 -0800 (PST)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40c3ca9472dso59457925e9.2
        for <asahi@lists.linux.dev>; Tue, 19 Dec 2023 17:44:35 -0800 (PST)
X-Received: by 2002:a05:600c:524b:b0:40c:4857:e012 with SMTP id
 fc11-20020a05600c524b00b0040c4857e012mr5485525wmb.85.1703036675282; Tue, 19
 Dec 2023 17:44:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231107-brcmfmac-wpa3-v1-1-4c7db8636680@marcan.st>
 <170281231651.2255653.7498073085103487666.kvalo@kernel.org>
 <18c80d15e30.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
 <1b51997f-2994-46e8-ac58-90106d1c486d@marcan.st> <c392f901-789a-42e2-8cf7-5e246365a1ca@broadcom.com>
 <CAF4BwTXNtu30DAgBXo4auDaDK0iWc9Ch8f=EH+facQ-_F-oMUQ@mail.gmail.com>
 <87r0jiqmnx.fsf@kernel.org> <01bd8c68-1b9c-49b2-8ace-1c7d1b5192ad@marcan.st>
In-Reply-To: <01bd8c68-1b9c-49b2-8ace-1c7d1b5192ad@marcan.st>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 19 Dec 2023 17:44:18 -0800
X-Gmail-Original-Message-ID: <CAHk-=whDLKZZEuxU_jEhZRdeWjXAkL8=J_JRk2Ar6wp9UK3h2w@mail.gmail.com>
Message-ID: <CAHk-=whDLKZZEuxU_jEhZRdeWjXAkL8=J_JRk2Ar6wp9UK3h2w@mail.gmail.com>
Subject: Re: [PATCH] wifi: brcmfmac: cfg80211: Use WSEC to set SAE password
To: Hector Martin <marcan@marcan.st>
Cc: Kalle Valo <kvalo@kernel.org>, Daniel Berlin <dberlin@dberlin.org>, 
	Arend van Spriel <arend.vanspriel@broadcom.com>, Arend van Spriel <aspriel@gmail.com>, 
	Franky Lin <franky.lin@broadcom.com>, Hante Meuleman <hante.meuleman@broadcom.com>, 
	SHA-cyfmac-dev-list@infineon.com, asahi@lists.linux.dev, 
	brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org, 
	linux-wireless@vger.kernel.org, David Airlie <airlied@redhat.com>, 
	Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Dec 2023 at 16:06, Hector Martin <marcan@marcan.st> wrote:
>
> On 2023/12/19 23:42, Kalle Valo wrote:
> >
> > Why is it that every patch Hector submits seems to end up with flame
> > wars?

Well, I do think some of it is Hector's personality and forceful
approaches, but I do think part of it is also the area in question.

Because I do agree with Hector that..

> Just recently a patch was posted to remove the Infineon list from
> MAINTAINERS because that company cares so little they have literally
> stopped accepting emails from us. Meanwhile they are telling their
> customers that they do not recommend upstream brcmfmac and they should
> use their downstream driver [1].

Unquestionably broadcom is not helping maintain things, and I think it
should matter.

As Hector says, they point to their random driver dumps on their site
that you can't even download unless you are a "Broadcom community
member" or whatever, and hey - any company that works that way should
be seen as pretty much hostile to any actual maintenance and proper
development.

If Daniel and Hector are responsive to actual problem reports for the
changes they cause, I do think that should count a lot.

I don't think Cypress support should necessarily be removed (or marked
broken), but if the sae_password code already doesn't work, _that_
part certainly shouldn't hold things up?

Put another way: if we effectively don't have a driver maintainer that
can test things, and somebody is willing to step up, shouldn't we take
that person up on it?

                  Linus
