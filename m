Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629F81A0708
	for <asahi@lists.linux.dev>; Mon, 23 Sep 2024 18:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727115550; cv=none; b=S30P4tB4+UDEZ7ghnJd1O/8TYIhNMbP5UsUOAg3N26cK7St5+tBmwJajRZ+LcOjTThvebcA2dlmfwfMsekTX/bez55u/Cg6lZhWK4bQa8TtG1ybTQ1eTO8CIo9XAnJNcEnw9LaL+q11+AdHbuGpZEMH1KAVgeMe0PQkoiBLbXNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727115550; c=relaxed/simple;
	bh=oXNzm4MZb0k/XXfQMZMx6410zG4bTNO8FdzpKDFiStc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CqCn0GYJUnAuOtWcpJF20huszQy34CG5g14BpE1zMnI4r/x1GqzEXJQOv3NJ5TI3yxeU5blmwq2CvG+66HmywuQM/8OJTYjQVxlJNrVePIXgRe6F3klFEnIu72SH+HME1HKSnfWCwYbZo0xPRtKgInuybXT+mVXwM7xjmlgrgws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PvoE1H5g; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PvoE1H5g"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e165fc5d94fso7384420276.2
        for <asahi@lists.linux.dev>; Mon, 23 Sep 2024 11:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727115547; x=1727720347; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7d86bJdCRGCypNEWHvJnM+7Kig6RbYD9GxfCLKVtKPE=;
        b=PvoE1H5guj1HlbOSWQwVi+WeX46TP2Mvyd9Q0Eiky9F33ma48W2u0Y7VNh9cT2YO4w
         s7sk7bR+g3eWBHtn5v4tL18S2EbamZ95jtUkxtUT6s2cAdQuDNIoSPkpGkWEnJqjmI5k
         Z3lqfbRwG6cdgy7R3h3y0RV5OXffCrgLIE2RAbIbIWuVZIxlFfUARFmgtVuzrHkUxTV4
         b+wOQHjCbfXvfswlOF4UlOSsKeC/I7o5FwvI18IezFczKiH8Suu70JBdNuFDNStC4ffv
         ux3hww5vZqC+JK3U3JOvSJ2qJOzL6w7X2yUZnxmsrJUjxUEy5A1J8BD9kM4STPKFX6Tj
         JfrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727115547; x=1727720347;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7d86bJdCRGCypNEWHvJnM+7Kig6RbYD9GxfCLKVtKPE=;
        b=TpbyykDloODAOp1Fz45Ee1cdvrzMO7Wu2CimNxY/nT6Rd4yLRUtcOyt55aKwTSf1vv
         s6PMZpdsHDKIgoS+xivPmjGchdimSly+zfYGVTBX7rvhDn7aesoG9kwRRWwYq8UxhDJc
         yCCmqq+E8ubGOHdc+GYvq2UgQ6BNaOj/4grI0TyA3H80+tODEsKWO2bUpOgo9p44rMMI
         F7EiqFUPyUaPSC1tnggx6oWveBkjMQwQeJQ0RJKNkNN82AxDcOW6gcouwq1FklMdH2/N
         XE6+vzx5LyRzHBErl6aq0PzPohX9Z2tvbSbXCd3tBXMllYfu8/DP85JLg3pz5HFP7zKE
         8uIQ==
X-Forwarded-Encrypted: i=1; AJvYcCW47P6MEnfBE6dFrVmCT+esuPrY1OLvvd/fcpeKdneP22DwLcWs7JBd6E4X+cl3FaaXUrblnw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxOS1F/6UxHz8oQ1+WRMV28lZD5R+yV0yCFN84yniE1Rtv9mn2h
	KCt+5Se0I/oB2rsgXWvGGb7L7zSWtsr5HzZBBQpuPkskIlKYgzaYEn/PTMsDsb784DHzTd0eiDj
	C7RVf/EzNBawYJM80VvFiZkjjZA==
X-Google-Smtp-Source: AGHT+IHm2Anof1qGJ9R1CvWT3pkt5SNmdiVkAOQ5LZRBMwdvknPsZ+Wqwa1ekbtEl+NQeccCrcS1Kq2JDKfyTFFeZVE=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a25:690e:0:b0:e1d:21ae:3b95 with SMTP
 id 3f1490d57ef6-e2252fe2127mr32035276.10.1727115547235; Mon, 23 Sep 2024
 11:19:07 -0700 (PDT)
Date: Mon, 23 Sep 2024 18:18:47 +0000
In-Reply-To: <20240923181846.549877-22-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240923181846.549877-22-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=2207; i=samitolvanen@google.com;
 h=from:subject; bh=oXNzm4MZb0k/XXfQMZMx6410zG4bTNO8FdzpKDFiStc=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDGkfN7IpMgaalZt/ZdNgMn5hGFUwv/f5BSflZZ//L7YV2
 au9/cPfjlIWBjEOBlkxRZaWr6u37v7ulPrqc5EEzBxWJpAhDFycAjCR3leMDFfk1WPEjs9IzO6Y
 ry/OH+RzXaBp+eTWuw8rJO47lKz1us/wP0xmVZtejIrC77VzTjnVp3f196efPWzpckN52UR/ucQ 8DgA=
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240923181846.549877-23-samitolvanen@google.com>
Subject: [PATCH v3 01/20] scripts: import more list macros
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, 
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, 
	Miroslav Benes <mbenes@suse.cz>, Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Import list_is_first, list_is_last, list_replace, and list_replace_init.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 scripts/include/list.h | 50 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/scripts/include/list.h b/scripts/include/list.h
index fea1e2b79063..8bdcaadca709 100644
--- a/scripts/include/list.h
+++ b/scripts/include/list.h
@@ -127,6 +127,36 @@ static inline void list_del(struct list_head *entry)
 	entry->prev = LIST_POISON2;
 }
 
+/**
+ * list_replace - replace old entry by new one
+ * @old : the element to be replaced
+ * @new : the new element to insert
+ *
+ * If @old was empty, it will be overwritten.
+ */
+static inline void list_replace(struct list_head *old,
+				struct list_head *new)
+{
+	new->next = old->next;
+	new->next->prev = new;
+	new->prev = old->prev;
+	new->prev->next = new;
+}
+
+/**
+ * list_replace_init - replace old entry by new one and initialize the old one
+ * @old : the element to be replaced
+ * @new : the new element to insert
+ *
+ * If @old was empty, it will be overwritten.
+ */
+static inline void list_replace_init(struct list_head *old,
+				     struct list_head *new)
+{
+	list_replace(old, new);
+	INIT_LIST_HEAD(old);
+}
+
 /**
  * list_move - delete from one list and add as another's head
  * @list: the entry to move
@@ -150,6 +180,26 @@ static inline void list_move_tail(struct list_head *list,
 	list_add_tail(list, head);
 }
 
+/**
+ * list_is_first -- tests whether @list is the first entry in list @head
+ * @list: the entry to test
+ * @head: the head of the list
+ */
+static inline int list_is_first(const struct list_head *list, const struct list_head *head)
+{
+	return list->prev == head;
+}
+
+/**
+ * list_is_last - tests whether @list is the last entry in list @head
+ * @list: the entry to test
+ * @head: the head of the list
+ */
+static inline int list_is_last(const struct list_head *list, const struct list_head *head)
+{
+	return list->next == head;
+}
+
 /**
  * list_is_head - tests whether @list is the list @head
  * @list: the entry to test
-- 
2.46.0.792.g87dc391469-goog

