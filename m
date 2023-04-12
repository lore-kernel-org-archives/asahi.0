Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931E49472
	for <asahi@lists.linux.dev>; Wed, 12 Apr 2023 19:43:05 +0000 (UTC)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-1842df7cb53so15069617fac.10
        for <asahi@lists.linux.dev>; Wed, 12 Apr 2023 12:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681328584; x=1683920584;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IdB/hLt0KneusiaDF2I1jfYOiiJrqd1wU01GfkTo2zM=;
        b=bLidngYk5mUNNRfOUqyt3rv5G80gPT2hTit3Q5VhFMu+z3G4vs4I1mLVQiFFCFnS73
         9tjbLHC3vIlRedrsVSfS0ESlSN/wB/T3ZSiIaNv/BCd7Y1x7jOe6tbKO190HdUN07I9Z
         3WeuxgMxAPQVvIs7R/uJr2pxN5hXtqCAImCcO+1gfPa1srm29U4PBLqihF/0m/ZW9x+m
         EgSqqfGTZGm4PfM7qyuKNxmF9EdZbHTszb5JkCRFDcx9pPUIgrznyjLaimrGirbKFRP6
         2EeLypOWxZKMXEltMqlRJ1w6TbPaDqkwhD7UUzpk2EfNiEwdGJlK13Nrn1oKvaUH34R7
         zVQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681328584; x=1683920584;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IdB/hLt0KneusiaDF2I1jfYOiiJrqd1wU01GfkTo2zM=;
        b=Q09TPkLVDcD1lzdQxKHuq3dzcJPZQfYOELkKDtuCX/8bngm4a5ddFmt1K13b0kLfwD
         Dq51djq4mDmmjBO6zk/z8j06Ys0eqEkHsFAaDiTtpcS1zwEB0yGaQB1rnZS/Q6uHlteE
         /kaJO1+GBmXCQgZ8+015m7uuPSPHOpKE7qq/1Wc7CrNKIRZulu32a0c6jN+Ci9G+Hb+O
         cSfyTgW7OlgKI0y+KL7Nx2wwP2AWdTTT4VpGWiFFeLxT/j+RkVuqP5BuDA448O2Vi/3j
         v84mWkloJUNQyi/LFGMHB1JZeQbF09Br/ZLbtbMXAdNTChwkfWyq+Iq6ZjIp8WO2kJsH
         8qWA==
X-Gm-Message-State: AAQBX9fOlO5fWGQD9vYJrs3XBqKxAIU4zhShCh8SBXc2UgjKeEHhOD3O
	knt71rRO4GXs1M7LFBPRNoT1FjmsiSPcyl1vyE6BziExLnuP6Q==
X-Google-Smtp-Source: AKy350ZD3g9VjU/1de6/dEtOQI0Kcc2/jhSKFPG3vfHzGufxdBOMX6EtAF/DJRrGffTz2XpYPvv4jYMeOpki3yXV99k=
X-Received: by 2002:a05:6870:b252:b0:187:773a:3930 with SMTP id
 b18-20020a056870b25200b00187773a3930mr21444oam.9.1681328584357; Wed, 12 Apr
 2023 12:43:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Robert Landers <landers.robert@gmail.com>
Date: Wed, 12 Apr 2023 21:42:51 +0200
Message-ID: <CAPzBOBMymQq8MeDxPCcEgMdr=p_VZ_pz=fP8H7hFjONGHtVzfQ@mail.gmail.com>
Subject: subscription fails from spam assassin
To: asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello,

I'm going to take a shot in the dark that this works like other
mailing lists and that simply mailing the list will still deliver the
email, I just won't get the replies unless someone intentionally
emails me back.

Anyway, I tried subscribing per the instructions on the website,
however, my subscription bounces back with a 550 'Blocked by
SpamAssassin'. This seems unintentional and might be a bug? I'm not
sure who to contact, but maybe you do.

Robert Landers
Software Engineer
Utrecht NL
